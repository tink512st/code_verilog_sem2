`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 11:09:27 AM
// Design Name: 
// Module Name: detector_RGB_ball_tb
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


module detector_RGB_ball_tb_non_overlap;
reg clk,rst;
reg [1:0] inp;
wire det;
detector_RGB_ball_moor_non_overlap uut(det,clk,rst,inp);
always #5 clk = ~clk;
parameter R = 2'b00, G = 2'b01, B = 2'b10;
initial begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    //bat dau kiem tra
    inp = R; #10;
    inp = G; #10;
    inp = B; #10;
    
    inp = R; #10;
    inp = B; #10;
    
    inp = B; #10;
    inp = R; #10;
    inp = G; #10;
    $stop;
end
endmodule
