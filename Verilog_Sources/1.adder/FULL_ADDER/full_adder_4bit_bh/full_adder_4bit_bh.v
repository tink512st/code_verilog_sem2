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


module full_adder_4bit_bh(Sum,Cout,A,B,Cin);
    input [3:0] A,B;
    input Cin;
    output reg [3:0] Sum;
    output reg Cout;
    
    always @(A,B,Cin) begin
        {Cout,Sum} = A + B + Cin;
    end
endmodule
