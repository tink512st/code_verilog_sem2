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


module encoder_4to2_df(y,v,I);
input [3:0] I;
output v;
output [1:0] y;

assign {v,y} = {
    |I,
    I[3] | I[2],
    I[3] | I[1]
};
endmodule
