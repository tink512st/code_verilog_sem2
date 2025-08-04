`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2025 09:30:11 PM
// Design Name: 
// Module Name: fifo_uart_TB
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


module fifo_uart_TB;
reg clk = 0,rst = 0,push_in = 0,pop_in = 0,en = 0;
reg [3:0] thres_hold = 0;
reg [7:0] din = 0;
wire [7:0] dout;
wire empty, full, underrun, overrun, thres_trig;
fifo_uart dut(thres_trig, overrun, underrun, empty, full, dout, din, thres_hold, clk, rst,push_in, pop_in, en);
reg[4:0] i;
always #5 clk = ~clk;

initial begin
    rst = 1;
    repeat(5)@(posedge clk);
    rst = 0;
    for(i = 0;i <20; i=i+1) begin
        en = 1'b1;
        push_in = 1'b1;
        din = $urandom();
        pop_in = 1'b0;
        thres_hold = 4'ha;
        @(posedge clk);
    end
    
    for(i = 0;i <20; i=i+1) begin
        en = 1'b1;
        push_in = 1'b0;
        pop_in = 1'b1;
        thres_hold = 4'ha;
        @(posedge clk);
    end
    $stop;
end
endmodule
