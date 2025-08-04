`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 03:11:57 PM
// Design Name: 
// Module Name: ALU_opcode_4bit_tb
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


module ALU_opcode_4bit_tb;

reg [3:0] a,b,opcode;
wire [3:0] x,y;
ALU_opcode_4bit uut1(x,y,a,b,opcode);
initial begin
    opcode = 4'd0;
    a = 4'b0101; b = 1; #10;
    opcode = 4'd4;
    a = 4'b1010; b = 4'b1101; #10;
    opcode = 4'd11;
    a = 4'd2; b = 4'd15; #10;
    opcode = 4'd11;
    a = 4'd10; b = 4'd15; #10;
    opcode = 4'd11;
    a = 4'd10; b = 4'd2; #10;
    $stop;
end
endmodule
