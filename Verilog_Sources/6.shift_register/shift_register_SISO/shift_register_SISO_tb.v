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


module shift_register_SISO_tb;
reg In,Clk;
wire Out;

shift_register_SISO uut1(.Out(Out),.In(In),.Clk(Clk));
initial begin
    Clk = 0;
    forever #10 Clk = ~Clk;
end

initial begin
//dich gia tri 1101 vao thanh ghi va dua bit thap truoc
    In = 1; #20;
    In = 0; #20;
    In = 1; #20;
    In = 1; #20;
// lay gia tri cua thanh ghi sau 4 xung tiep theo
    In = 0; #20;
    In = 0; #20;
    In = 0; #20;
    In = 0; #20;
    $stop; 
end
endmodule