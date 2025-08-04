`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 09:44:04 AM
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


module top(clk_in,rst,LED);
input clk_in,rst;
output [7:0] LED;
wire clk_wire;
div_clk_100Mhz_to_1Hz ic1(clk_in,rst,clk_wire);
LED_SHIFT_RIGHT ic2(clk_wire,rst,LED);
endmodule
