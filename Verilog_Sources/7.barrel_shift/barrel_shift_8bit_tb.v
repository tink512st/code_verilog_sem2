`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 11:43:39 AM
// Design Name: 
// Module Name: barrel_shift_8bit_tb
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


module barrel_shift_8bit_tb;
reg [7:0] in;
reg Lr;
reg [2:0] n;
wire [7:0] out;

barrel_shift_8bit uut(out,in,Lr,n);
initial begin
    in = 8'b1011_0111;
    //cho dich trai 
    Lr = 1;
    n = 3; #10; //dich trai 3 bit
    n = 4; #10; //dich trai 4 bit
    //cho dich phai
    Lr = 0;
    n = 2; #10; //dich phai 2 bit
    n = 3; #10; //dich phai 3 bit
    $stop;
    
end
endmodule
