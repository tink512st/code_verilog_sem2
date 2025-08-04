`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 11:17:06 PM
// Design Name: 
// Module Name: encoder_3to8_df
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


module decoder_3to8_df(out,in,en);
input [2:0] in;
input en;
output [7:0] out;

assign out = {
    en & in[2] & in[1] & in[0],
    en & in[2] & in[1] & ~in[0],
    en & in[2] & ~in[1] & in[0],
    en & in[2] & ~in[1] & ~in[0],
    
    en & ~in[2] & in[1] & in[0],
    en & ~in[2] & in[1] & ~in[0],
    en & ~in[2] & ~in[1] & in[0],
    en & ~in[2] & ~in[1] & ~in[0]
};
endmodule
