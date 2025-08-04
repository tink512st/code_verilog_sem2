`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2025 11:24:24 AM
// Design Name: 
// Module Name: shift_register
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


module shift_register_SIPO(Q,In,Clk);

input In,Clk;
output reg [3:0]Q;

always @(posedge Clk) begin
    Q[3] <= In;
    Q[2] <= Q[3];
    Q[1] <= Q[2];
    Q[0] <= Q[1];
end
endmodule
