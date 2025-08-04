`timescale 1ns / 1ps
module top_count_4led_7seg_tb;
reg clk_in,rst;
reg [2:0] sel_an;
wire [6:0] seg;
wire [3:0] an;

top_count_4led_7seg dut(clk_in,rst,seg,an,sel_an);
initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;
end
initial begin
    rst = 1; sel_an = 3'd4;
    repeat(5) @(posedge clk_in);
    rst = 0;
    #4_000_000;
    sel_an = 3'd2;
    #8_000_000;
    $stop;
end
endmodule
