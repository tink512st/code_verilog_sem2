`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 02:07:43 PM
// Design Name: 
// Module Name: decoder_2to4_bh_tb
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


module decoder_2to4_bh_tb;
reg [1:0] in;
reg en;
wire [3:0] out;

decoder_2to4_bh uut1(out,in,en);
initial begin
    //Truong hop cho en = 1 
    en = 1;
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
    //Truong hop cho en = 0
    en = 0;
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
    $stop;
end
endmodule
