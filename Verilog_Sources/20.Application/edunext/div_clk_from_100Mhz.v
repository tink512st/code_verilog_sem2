`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2025 09:51:44 AM
// Design Name: 
// Module Name: div_clk_from_100Mhz
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


module div_clk_from_100Mhz(clk,rst,sel_freq,clk_out);
input clk,rst;
input [1:0] sel_freq;
output reg clk_out;

parameter sys_freq = 100_000_000; // 100Mhz
parameter K_1Hz = 100_000_000;
parameter K_2Hz = 50_000_000;
parameter K_5Hz = 20_000_000; 
parameter K_10Hz = 10_000_000;

reg [25:0] counter = 1;
always@(posedge clk, posedge rst) begin
    if(rst) begin
        counter <= 1;
        clk_out <= 0;
    end
    else begin
        counter <= counter + 1;
        case(sel_freq) 
            2'd0: begin
                if(counter >= K_1Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
            2'd1: begin
                if(counter >= K_2Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
            2'd2: begin
                if(counter >= K_5Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
            2'd3: begin
                if(counter >= K_10Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
        endcase
    end
end
endmodule
