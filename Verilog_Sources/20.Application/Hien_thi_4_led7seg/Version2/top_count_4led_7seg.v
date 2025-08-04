`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 10:58:28 AM
// Design Name: 
// Module Name: top_count_4led_7seg
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


module top_count_4led_7seg(clk_in,rst,seg,an,sel_an);
input clk_in,rst;
input [2:0] sel_an;
output [6:0] seg;
output [3:0] an;
wire [3:0] num_wire;
wire clk_wire;
wire [3:0] an_scan_wire;
div_clk_t ic1(.clk(clk_in),.rst(rst),.sel_an(sel_an),.num(num_wire),.an_scan(an_scan_wire));
test_decoder_7segment ic3(.num(num_wire),.seg(seg),.sel_an(an_scan_wire),.an(an));
endmodule
