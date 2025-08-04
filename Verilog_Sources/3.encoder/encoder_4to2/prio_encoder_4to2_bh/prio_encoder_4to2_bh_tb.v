`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 12:11:35 AM
// Design Name: 
// Module Name: prio_encoder_4to2_bh_tb
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


module prio_encoder_4to2_bh_tb;
reg[3:0] I;
wire v;
wire [1:0] y;

prio_encoder_4to2_bh uut(y,v,I);

initial begin
    I = 4'b0001; #10;
    I = 4'b0010; #10;
    I = 4'b0100; #10;
    I = 4'b1000; #10;
    I = 4'b0000; #10;
    $stop;
end
endmodule
