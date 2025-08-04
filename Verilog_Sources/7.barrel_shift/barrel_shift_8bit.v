`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 11:40:50 AM
// Design Name: 
// Module Name: barrel_shift_8bit
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


module barrel_shift_8bit(out,in,Lr,n);
input [7:0] in;
input Lr;
input [2:0] n;
output reg [7:0] out;

always @(*) begin
    if(Lr)
        out = in << n;
    else 
        out = in >> n;
end
endmodule
