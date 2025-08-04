`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 02:01:12 PM
// Design Name: 
// Module Name: decoder_2to4_bh
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_2to4_bh(out,in,en);
input [1:0] in;
input en;
output reg [3:0] out;

always @(*) begin
    case({en,in}) 
        3'b100: out = 4'b0001;
        3'b101: out = 4'b0010;
        3'b110: out = 4'b0100;
        3'b111: out = 4'b1000;
        default : out = 4'b0000;
    endcase
end
endmodule
