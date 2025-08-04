`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 10:11:20 AM
// Design Name: 
// Module Name: compartor_4bit_bh
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


module compartor_4bit_bh(Eq,Gt,Sm,A,B);
input [3:0] A,B;
output reg Eq,Gt,Sm;

always @(*) begin
    Eq = A == B;
    Gt = A > B;
    Sm = A < B;
end
endmodule
