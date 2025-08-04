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


module shift_register_PISO(Q,d,sel,Clk);

input Clk,sel;
input [3:0] d;
output reg Q;

reg Q0,Q1,Q2; //Q3 tuong ung la Q
always @(posedge Clk) begin
    Q0 <= d[3];
    if(sel == 1'b0) begin
        Q1 <= d[2];
        Q2 <= d[1];
        Q <= d[0];
    end
    else begin
        Q1 <= Q0;
        Q2 <= Q1;
        Q <= Q2;
    end
end
endmodule
