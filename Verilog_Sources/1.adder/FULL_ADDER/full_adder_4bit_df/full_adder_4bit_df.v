`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2025 09:19:37 AM
// Design Name: 
// Module Name: FULL_ADDER_beha
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


module full_adder_4bit_df(Sum,Cout,A,B,Cin);
    input [3:0] A,B;
    input Cin;
    output [3:0] Sum;
    output Cout;
    
    assign {Cout,Sum} = A+B+Cin;
endmodule
