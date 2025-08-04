`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 09:50:20 PM
// Design Name: 
// Module Name: div_clk_to 40Hz
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


module div_clk_to_40Hz(clk,rst,out_40Hz);
input clk,rst;
output reg out_40Hz;
parameter sys_freq = 100000; //100Mhz
parameter slow_clk_freq = 40; 
parameter K = sys_freq / slow_clk_freq;
reg [20:0] counter;

always@(posedge clk, posedge rst) begin
    if(rst) begin
        counter <= 4'd1;
        out_40Hz <= 0;
    end
    else if(counter == K/2) begin
        out_40Hz <= ~out_40Hz;
        counter <= 1;
    end
    else 
        counter <= counter + 1;
end
endmodule
