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


module shift_register_SISO(Out,In,Clk);

input In,Clk;
output reg Out;
reg Q1,Q2,Q3;

always @(posedge Clk) begin
    Q1 <= In;
    Q2 <= Q1;
    Q3 <= Q2;
    Out <= Q3;
end
endmodule
