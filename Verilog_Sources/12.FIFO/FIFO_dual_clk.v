module FIFO_dual_clk(buff_out,buff_empty,buff_full,FIFO_counter,clk_w,clk_r,rst,wr_en,r_en,buff_in);
input clk_w,clk_r,rst,wr_en,r_en;
input [7:0] buff_in;
output buff_empty,buff_full;
output [7:0] buff_out;
output [7:0] FIFO_counter;

reg buff_empty_v, buff_full_v;
reg [7:0] buff_out_v;
reg [5:0] FIFO_counter_v;
reg [6:0] w_count, r_count;
reg [5:0] rd_ptr,wr_ptr;
reg [7:0] buff_mem[63:0];

//khoi always xet trang thai empty hay full khong
always @(w_count, r_count) begin
    buf_empty_v = (w_count[5:0] == r_count[5:0]) && (w_count[6] == r_count[6]);
	buf_full_v  = (w_count[5:0] == r_count[5:0]) && (w_count[6] ^  r_count[6]);

end 

// khoi always de quyet dinh gia tri cua counter khi co xung clk_w
always@(posedge clk_w or posedge rst) begin
    if(rst)
        w_count <= 0;
    else if(!buff_full_v && wr_en) 
        w_count <= w_count + 1;
end
// khoi always de quyet dinh gia tri cua counter khi co xung clk_r
always @(posedge clk_r or posedge rst) begin
    if(rst)
		r_count <= 0;
	else if(!buff_empty_v && r_en)
        r_count <= r_count + 1;
end
//khoi always de dua gia tri tu buffer_in vao khoi FIFO
always@(posedge clk_w) begin
    if(!buff_full_v && wr_en)
        buff_mem[wr_ptr] <= buff_in;
end
//khoi always de lay gia tri ra khoi FIFO dem den buffer_out
always@(posedge clk_r or posedge rst) begin
    if(rst)
        buff_out_v <= 0;
    else if(!buff_empty_v && r_en)
        buff_out_v <= buff_mem[rd_ptr];
end
//khoi always xac dinh con tro write va read cua FIFO
always @(posedge clk_w or posedge rst) begin
    if(rst)
        wr_ptr <= 0;
    else 
        if(!buff_full_v && wr_en)
            wr_ptr <= wr_ptr + 1;
        else 
            wr_ptr <= wr_ptr;
end
always @(posedge clk_r or posedge rst) begin
    if(rst) 
        rd_ptr <= 0;
    else 
        if(!buff_empty_v && r_en) 
            rd_ptr <= rd_ptr + 1;
        else 
            rd_ptr <= rd_ptr;
end
assign buff_out = buff_out_v;
assign buff_empty = buff_empty_v;
assign buff_full = buff_full_v;
assign FIFO_counter = w_count - r_count;
endmodule
