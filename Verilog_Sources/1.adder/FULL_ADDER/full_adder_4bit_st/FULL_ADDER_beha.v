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


module FULL_ADDER_beha(Sum,Cout,A,B,Cin);
    input A,B,Cin;
    output reg Sum,Cout;
    
    always @(A,B,Cin) begin
        Sum = Cin ^ (A ^ B);
        Cout = A&B | B&Cin | Cin&A;
    end
endmodule
