module led7seg_AN(seg,num);
input [3:0] num;
output reg [6:0] seg;
always @(num) begin
    case(num)
        4'b0000: seg = 7'h3F;
        4'b0001: seg = 7'h06;
        4'b0010: seg = 7'h5B;
        4'b0011: seg = 7'h4F;
        4'b0100: seg = 7'h66;
        4'b0101: seg = 7'h6D;
        4'b0110: seg = 7'h7D;
        4'b0111: seg = 7'h07;
        4'b1000: seg = 7'h7F;
        4'b1001: seg = 7'h6F;
        default: seg = 7'h00;
    endcase
end
endmodule
