`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2025 08:10:24 PM
// Design Name: 
// Module Name: d_ff_posedge_posrst
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


module d_ff_Po_Alr_Ahs_sync(q,clk,d,rst,set);
input clk,d,rst,set;
output reg q;

always @(posedge clk ) begin
    if(!rst)
        q <= 0;
    else if(set)
        q <= 1;
    else 
        q <= d;
end
endmodule
