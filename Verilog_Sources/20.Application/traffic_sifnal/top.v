`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 10:57:18 AM
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


module top(clk,rst,pole1,pole2,led7seg);
input clk,rst;
output [2:0] pole1, pole2;
output [6:0] led7seg;

wire clk_out;
wire [3:0] count_w;
div_clk_100Mhz_to_1Hz ic1(clk,rst,clk_out);
traffic_signals ic2(clk_out,rst,pole1,pole2,count_w);
led7seg_AN ic3(led7seg,count_w);
endmodule
