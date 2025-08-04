`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 10:05:52 AM
// Design Name: 
// Module Name: compartor_4bit_df_tb
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


module compartor_4bit_df_tb;
reg [3:0] A,B;
wire Eq,Gt,Sm;

compartor_4bit_df uut1(Eq,Gt,Sm,A,B);
initial begin
    A = 4'b1010; B = 4'b1010; #10;
    A = 4'b1110; B = 4'b1010; #10;
    A = 4'b1010; B = 4'b1011; #10;
    A = 4'b1001; B = 4'b1001; #10;
    $stop;
end
endmodule
