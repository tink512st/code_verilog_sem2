`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 11:20:22 PM
// Design Name: 
// Module Name: encoder_3to8_tb
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


module decoder_3to8_tb;
reg [2:0] in;
reg en;
wire [7:0] out;

decoder_3to8_df uut1(out,in,en);

initial begin
    en = 1;
    in[2] = 0; in[1] = 0; in[0] = 0; #10;
    in[2] = 0; in[1] = 0; in[0] = 1; #10;
    in[2] = 0; in[1] = 1; in[0] = 0; #10;
    in[2] = 0; in[1] = 1; in[0] = 1; #10;
    in[2] = 1; in[1] = 0; in[0] = 0; #10;
    in[2] = 1; in[1] = 0; in[0] = 1; #10;
    in[2] = 1; in[1] = 1; in[0] = 0; #10;
    in[2] = 1; in[1] = 1; in[0] = 1; #10;
    
    en = 0;
    in[2] = 0; in[1] = 0; in[0] = 0; #10;
    in[2] = 0; in[1] = 0; in[0] = 0; #10;
    in[2] = 0; in[1] = 0; in[0] = 0; #10;
    in[2] = 0; in[1] = 0; in[0] = 0; #10;
    $stop;
end
endmodule
