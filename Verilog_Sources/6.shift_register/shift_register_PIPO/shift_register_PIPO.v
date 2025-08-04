`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2025 11:24:24 AM
// Design Name: 
// Module Name: shift_register
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


module shift_register_left_right(QL,QR,sel,in,Clk);

input Clk,in,sel;
output reg QL,QR;
reg [3:0] Q;
always @(posedge Clk) begin
// sel = 1 dich phai ; sel = 0 dich trai
    if(sel == 1'b1) begin
        QL <= in;
        Q[1] <= QL;
        Q[2] <= Q[1];
        QR <= Q[2];
    end
    else begin
        QR <= in;
        Q[2] <= QR;
        Q[1] <= Q[2];
        QL <= Q[1];
    end
end
endmodule
