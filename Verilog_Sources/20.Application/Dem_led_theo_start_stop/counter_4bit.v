`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2025 09:27:41 AM
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit(clk,rst,ud,out,start_vl,stop_vl,LED);
input clk,rst,ud;
input [3:0] start_vl ,stop_vl;
output reg [3:0] out;
output [7:0] LED;
initial begin
    out = 4'd0;
end

assign LED = {start_vl,stop_vl};

always@(posedge clk,posedge rst) begin
    if(rst)
        out <= start_vl;
    else if(start_vl > stop_vl) begin
        if(ud == 1'b0) begin
            out <= out + 1;
            if(out == 4'd9)
                out <= 4'd0;
            else if(out >= stop_vl & out < start_vl)
                out <= start_vl;
        end
        else if(ud == 1'b1) begin 
            out <= out - 1;
            if(out == 4'd0)
                out <= 4'd9;
            else if(out <= start_vl & out > stop_vl)
                out <= stop_vl;
        end 
    end
    else if(ud == 1'b0) begin
        out <= out + 1;
        if(out >= stop_vl)
            out <= start_vl;
    end
    else if(ud == 1'b1) begin 
        out <= out - 1;
        if(out <= start_vl)
            out <= stop_vl;
    end 
end
endmodule
