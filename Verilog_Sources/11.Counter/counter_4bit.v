`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2025 09:27:41 AM
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit(clk,rst,ud,out );
input clk,rst,ud;
output reg [3:0] out;
initial begin
    out = 4'd0;
end
always@(posedge clk,posedge rst) begin
    if(rst)
        out <= 4'd0;
    else if(ud == 1'b0)
        out <= out + 1;
    else if(ud == 1'b1)
        out <= out - 1;
end
endmodule
