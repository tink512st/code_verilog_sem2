`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 08:27:40 AM
// Design Name: 
// Module Name: test_decoder_7segment
// Project Name: 
module test_decoder_7segment(num,seg,an);
input [3:0] num;
input [6:0] seg;
output [3:0] an;

led7seg_AN uut(seg,num);
assign an = 4'b1110;
endmodule
