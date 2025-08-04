`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 11:44:06 PM
// Design Name: 
// Module Name: encoder_4to2_bh
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
output reg v;
output reg [1:0] y;

always @(*) begin
    case(I) 
        4'b0001: {v,y} = 3'b100;
        4'b0010: {v,y} = 3'b101;
        4'b0100: {v,y} = 3'b110;
        4'b1000: {v,y} = 3'b111;
        4'd0,4'd3,4'd5,4'd6,4'd7,4'd9,4'd10,4'd11,
        4'd12,4'd13,4'd14,4'd15: {v,y} = 3'b000;
        default : $display("Error");
    endcase
end
endmodule
