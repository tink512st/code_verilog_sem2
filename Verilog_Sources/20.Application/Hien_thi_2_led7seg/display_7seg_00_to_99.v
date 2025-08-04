`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 10:20:30 PM
// Design Name: 
// Module Name: display_7seg_00_to_99
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


module display_7seg_00_to_99(clk,rst,seg,an_out);
input clk,rst;
output [6:0] seg;
output [3:0] an_out;

wire clk_40Hz;
wire [3:0] num;
wire [3:0] an;
div_clk_to_40Hz ic01(.clk(clk),.rst(rst),.out_40Hz(clk_40Hz));
count_and_scan ic02(.clk_in(clk_40Hz),.rst(rst),.cnt_out(num),.scan_an(an));
sel_an_led7seg ic03(.num(num),.seg(seg),.sel_an(an),.an_out(an_out));
endmodule
