`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2025 10:38:28 AM
// Design Name: 
// Module Name: dff_tb
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


module shift_register_PISO_tb;
reg Clk,sel;
reg [3:0] d;
wire Q;

shift_register_PISO uut1(.Q(Q),.Clk(Clk),.sel(sel),.d(d));
initial begin
    Clk = 0;
    forever #10 Clk = ~Clk;
end

initial begin
//tin hieu sel = 0 tuc la truyen gia tri vao thanh ghi
sel = 1'b0; d = 4'b1011; #20;
// tin hieu sel = 1 tuc la cho phep dich noi tiep cac bit ra Q
sel = 1'b1;
d = 4'b0000; #80; // chay qua 4 xung clk
    $stop; 
end
endmodule