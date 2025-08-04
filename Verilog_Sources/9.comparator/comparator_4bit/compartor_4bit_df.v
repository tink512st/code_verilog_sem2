`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 10:04:06 AM
// Design Name: 
// Module Name: compartor_4bit_df
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


module compartor_4bit_df(Eq,Gt,Sm,A,B);
input [3:0] A,B;
output Eq,Gt,Sm;

assign Eq = A == B;
assign Gt = A > B;
assign Sm = A < B;
endmodule
