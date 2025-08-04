`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 10:14:49 PM
// Design Name: 
// Module Name: sel_an_led7seg
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


module sel_an_led7seg(num,seg,sel_an,an_out);
input [3:0] num;
input [3:0] sel_an;
output [6:0] seg;
output [3:0] an_out;

assign an_out = sel_an;
led7seg_AN uut(.seg(seg),.num(num));
endmodule
