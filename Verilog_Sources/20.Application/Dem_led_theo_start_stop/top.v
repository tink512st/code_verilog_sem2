`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2025 09:38:34 AM
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


module top(clk_in,rst,seg,ud,ss,an,sel_freq,start_vl,stop_vl,LED);
input clk_in, rst, ud,ss,sel_freq;
input [3:0] start_vl,stop_vl;
output [6:0] seg;
output [3:0] an;
output [7:0] LED;
wire [3:0] counter;
wire clk_out;
wire clk_1Hz;

assign clk_1Hz = (ss == 1'b1)? 1'b0 : clk_in;

div_clk_100Mhz_to_1Hz div_1Hz(.clk_in(clk_1Hz),.rst(rst),.clk_out(clk_out),.sel_freq(sel_freq));
counter_4bit dem_4bit(.clk(clk_out),.rst(rst),.ud(ud),.out(counter),.start_vl(start_vl),.stop_vl(stop_vl),.LED(LED));
test_decoder_7segment led7seg(.num(counter),.seg(seg),.an(an));
endmodule
