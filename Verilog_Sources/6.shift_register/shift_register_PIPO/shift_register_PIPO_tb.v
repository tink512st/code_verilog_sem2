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


module shift_register_left_right_tb;
reg Clk,in,sel;
wire QL,QR;

shift_register_left_right uut1(QL,QR,sel,in,Clk);
initial begin
    Clk = 0;
    forever #10 Clk = ~Clk;
end

initial begin
// sel = 1 dich phai dua 2 bit 1 0 vao thanh ghi
sel = 1'b1; 
in = 1; #20;
in = 0; #20;

// sel = 0 dich trai dua 2 gia tri 1 1 vao thanh ghi
sel = 1'b1; 
in = 1; #20;
in = 1; #20;

in = 0; #80 // dich trai tiep 4 xung de dua cac bit ra ngo ra QL 
    $stop; 
end
endmodule