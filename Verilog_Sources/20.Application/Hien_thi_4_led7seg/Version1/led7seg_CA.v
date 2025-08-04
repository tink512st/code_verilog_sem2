module led7seg_AN(seg,num);
input [3:0] num;
output reg [6:0] seg;

always @(num) begin
    case(num)
        4'b0000: seg = 7'h40;
        4'b0001: seg = 7'h79;
        4'b0010: seg = 7'h24;
        4'b0011: seg = 7'h30;
        4'b0100: seg = 7'h19;
        4'b0101: seg = 7'h12;
        4'b0110: seg = 7'h02;
        4'b0111: seg = 7'h78;
        4'b1000: seg = 7'h00;
        4'b1001: seg = 7'h10;
    endcase
end
endmodule
