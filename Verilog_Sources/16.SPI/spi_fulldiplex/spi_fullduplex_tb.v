`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 02:53:48 PM
// Design Name: 
// Module Name: spi_fullduplex_tb
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


module spi_fullduplex_tb;
reg clk  = 0,rst,tx_en,miso = 0;
reg [7:0] data; 
wire mosi,cs;
wire sclk;
wire [7:0] dout;
wire done_rx;
spi_fullduplex dut(data,clk,rst,tx_en,miso,mosi,sclk,cs,dout,done_rx);
initial data = 8'b10101010;
reg [7:0] din = 8'b01010101;
always #5 clk = ~clk;
integer i;
initial begin
    rst = 1;
    repeat(5) @(posedge clk);
    rst = 0;
end
initial begin
    tx_en = 0;
    repeat(5) @(posedge clk);
    tx_en = 1;
    for(i = 0; i<8;i = i+1) begin
        @(posedge dut.sclk);
        miso = din[7-i];
    end
end
endmodule
