`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 10:29:35 PM
// Design Name: 
// Module Name: display_7seg_00_to_99_tb
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


module display_7seg_00_to_99_tb;
reg clk,rst;
wire [6:0] seg;
wire [3:0] an_out;

display_7seg_00_to_99 dut(clk,rst,seg,an_out);
initial begin
    clk = 0;
end
always #5 clk = ~clk;
initial begin
    rst = 1;
    repeat(5)@(posedge clk);
    rst = 0;
    #4_000_000;
    $stop;
end
endmodule
