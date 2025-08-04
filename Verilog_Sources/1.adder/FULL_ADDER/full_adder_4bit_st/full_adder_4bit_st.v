`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2025 10:50:52 PM
// Design Name: 
// Module Name: top
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


module full_adder_4bit_st(Cout,Sum,A,B,Cin);
input [3:0] A,B;
input Cin;
output [3:0] Sum;
output Cout;
wire N1,N2,N3;
FULL_ADDER_beha fa1(.Sum(Sum[0]),.Cout(N1),.A(A[0]),.B(B[0]),.Cin(Cin));
FULL_ADDER_beha fa2(.Sum(Sum[1]),.Cout(N2),.A(A[1]),.B(B[1]),.Cin(N1));
FULL_ADDER_beha fa3(.Sum(Sum[2]),.Cout(N3),.A(A[2]),.B(B[1]),.Cin(N2));
FULL_ADDER_beha fa4(.Sum(Sum[3]),.Cout(Cout),.A(A[3]),.B(B[3]),.Cin(N3));
endmodule
