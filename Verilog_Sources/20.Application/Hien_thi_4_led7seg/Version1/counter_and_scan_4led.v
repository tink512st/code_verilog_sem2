module counter_and_scan_4led(clk_in,rst,num,an_scan,sel_an);
input clk_in,rst;
input [1:0] sel_an;
output [3:0] num;
output [3:0] an_scan;

parameter sys_freq = 100_000_000; // 100 Mhz
parameter count_scan = 50;

reg[3:0] an_cur;
assign an_scan = an_cur;

reg [8:0] slow_clk_freq;

reg [7:0] counter_s_freq = 1;
reg [3:0] don_vi = 4'd0;
reg [3:0] chuc = 4'd0;
reg [3:0] tram = 4'd0;
reg [3:0] nghin = 4'd0;
always@(posedge clk_in) begin
    slow_clk_freq <=(count_scan * (sel_an+1)); 
end
always@(posedge clk_in,posedge rst) begin
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
always@(posedge clk_in, posedge rst) begin
    if(rst) 
        an_cur <= 4'b1110;
    else begin
        case(sel_an+1) 
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
            default : an_cur <= 4'b1110; 
        endcase
    end
end
assign num = (an_cur == 4'b1110)? don_vi : (an_cur == 4'b1101)? chuc : (an_cur == 4'b1011)? tram : (an_cur == 4'b0111)? nghin : don_vi;
endmodule
