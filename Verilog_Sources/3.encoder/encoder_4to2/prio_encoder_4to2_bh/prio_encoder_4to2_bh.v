`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 12:08:07 AM
// Design Name: 
// Module Name: prio_encoder_4to2_bh
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


module prio_encoder_4to2_bh(y,v,I);
input [3:0] I;
output reg v;
output reg [1:0] y;

always @(*) begin
    if(I[3]) 
     {v,y} = 3'b111;
    else if(I[2]) 
     {v,y} = 3'b110;
    else if(I[1]) 
     {v,y} = 3'b101;
    else if(I[0]) 
     {v,y} = 3'b100;
    else 
     {v,y} = 3'b000;
end
endmodule
