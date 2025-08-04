
module div_clk_t(clk,rst,sel_an,num,an_scan);
input [2:0] sel_an;
input clk,rst;
output [3:0] num;
output [6:0] an_scan;
//tham so cho tan so vao va so lan quet cua moi led
parameter sys_freq = 100000; //100Mhz
parameter count_scan = 50;
// bien luu tan so da chia va he so khi thay doi so led
reg clk_out = 1'b0;
reg [7:0] slow_clk_freq; 
reg [20:0] K; // neu sai thi sua K va counter nay
reg [19:0] counter;
//luu cac gia tri cho cac led hang don vi, chuc, tram , nghin
reg [7:0] counter_s_freq = 1;
reg [3:0] don_vi = 4'd0;
reg [3:0] chuc = 4'd0;
reg [3:0] tram = 4'd0;
reg [3:0] nghin = 4'd0;

reg[3:0] an_cur;

always@(posedge clk) begin
    slow_clk_freq = (count_scan * sel_an); 
    K = sys_freq / slow_clk_freq;
end

always@(posedge clk, posedge rst) begin
    if(rst) begin
        counter <= 4'd1;
        clk_out <= 0;
    end
    else if(counter == K/2) begin
        clk_out <= ~clk_out;
        counter <= 1;
    end
    else 
        counter <= counter + 1;
end

always@(posedge clk_out,posedge rst) begin
    if(rst) begin
        don_vi <= 4'd0;
        chuc <= 4'd0;
        tram = 4'd0;
        nghin = 4'd0;
        counter_s_freq = 1;
    end
    else if(counter_s_freq == slow_clk_freq ) begin
        don_vi <= don_vi + 1;
        counter_s_freq <= 1;
        if(don_vi == 4'd9) begin
            don_vi <= 4'd0;
            chuc <= chuc + 1;
            if(chuc == 4'd9) begin
                chuc <= 4'd0;
                tram <= tram + 1;
                if(tram == 4'd9) begin
                    tram <= 4'd0;
                    nghin <= nghin + 1;
                end
            end
        end
    end
    else 
        counter_s_freq <= counter_s_freq + 1;
end

always@(posedge clk_out, posedge rst) begin
    if(rst) 
        an_cur <= 4'b1110;
    else begin
        case(sel_an) 
            1: begin
                an_cur <= 4'b1110; 
            end
            2: begin
                an_cur[0] <= ~an_cur[0];
                an_cur[1] <= ~an_cur[1];
            end
            3: begin
               if(an_cur[2] == 1'b0)
                    an_cur <= 4'b1110;
               else begin
                    an_cur[2] <= an_cur[1];
                    an_cur[1] <= an_cur[0];
                    an_cur[0] <= 1'b1;
               end
            end
            4: begin 
                if(an_cur[3] == 1'b0)
                    an_cur <= 4'b1110;
               else begin
                    an_cur[3] <= an_cur[2];
                    an_cur[2] <= an_cur[1];
                    an_cur[1] <= an_cur[0];
                    an_cur[0] <= 1'b1;
               end
            end
        endcase
    end
end
assign num = (an_cur == 4'b1110)? don_vi : (an_cur == 4'b1101)? chuc : (an_cur == 4'b1011)? tram : (an_cur == 4'b0111)? nghin : don_vi;
assign an_scan = an_cur;
endmodule
