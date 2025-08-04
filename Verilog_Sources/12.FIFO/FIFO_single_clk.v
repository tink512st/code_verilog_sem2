module FIFO_single_clk(buff_out,buff_empty,buff_full,FIFO_counter,clk,rst,wr_en,r_en,buff_in);
input clk,rst,wr_en,r_en;
input [7:0] buff_in;
output buff_empty,buff_full;
output [7:0] buff_out;
output [7:0] FIFO_counter;

reg buff_empty_v, buff_full_v;
reg [7:0] buff_out_v;
reg [5:0] FIFO_counter_v;
reg [5:0] rd_ptr,wr_ptr;
reg [7:0] buff_mem[63:0];

//khoi always xet trang thai empty hay full khong
always @(FIFO_counter_v) begin
    buff_empty_v = (FIFO_counter_v==0);
    buff_full_v = (FIFO_counter_v==64);
end 

// khoi always de quyet dinh gia tri cua counter
always@(posedge clk or posedge rst) begin
    if(rst)
        FIFO_counter_v <= 0;
    else if((!buff_full_v && wr_en) && (!buff_empty_v && r_en)) 
        FIFO_counter_v <= FIFO_counter_v;
    else if(!buff_full_v && wr_en) 
        FIFO_counter_v <= FIFO_counter_v + 1;
    else if(!buff_empty_v && r_en)
        FIFO_counter_v <= FIFO_counter_v - 1;
    else
        FIFO_counter_v <= FIFO_counter_v;
end
//khoi always de dua gia tri tu buffer_in vao khoi FIFO
always@(posedge clk) begin
    if(!buff_full_v && wr_en)
        buff_mem[wr_ptr] <= buff_in;
    else 
        buff_mem[wr_ptr] <= buff_mem[wr_ptr];
end
//khoi always de lay gia tri ra khoi FIFO dem den buffer_out
always@(posedge clk or posedge rst) begin
    if(rst)
        buff_out_v <= 0;
    else
        if (!buff_empty_v && r_en)
            buff_out_v <= buff_mem[rd_ptr];
        else 
            buff_out_v <= buff_out_v;
end
//khoi always xac dinh con tro write va read cua FIFO
always @(posedge clk or posedge rst) begin
    if(rst) begin
        rd_ptr <= 0;
        wr_ptr <= 0;
    end
    else begin
        if(!buff_full_v && wr_en)
            wr_ptr <= wr_ptr + 1;
        else 
            wr_ptr <= wr_ptr;
        
        if(!buff_empty_v && r_en) 
            rd_ptr <= rd_ptr + 1;
        else 
            rd_ptr <= rd_ptr;
    end
end
assign buff_out = buff_out_v;
assign buff_empty = buff_empty_v;
assign buff_full = buff_full_v;
assign FIFO_counter = FIFO_counter_v;
endmodule
