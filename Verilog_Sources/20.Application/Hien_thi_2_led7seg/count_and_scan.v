`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 09:57:53 PM
// Design Name: 
// Module Name: count_and_scan
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


module count_and_scan(clk_in,rst,cnt_out,scan_an);
input clk_in,rst;
output [3:0] cnt_out;
output reg [3:0] scan_an;

reg [5:0] count;
reg [3:0] chuc;
reg [3:0] don_vi;

initial begin
    count = 6'd0;
    chuc = 4'd0;
    don_vi = 4'd0;
    scan_an = 4'b1110;
end
always@(posedge clk_in, posedge rst) begin
    if(rst) begin
        count <= 6'd0;
        chuc = 4'd0;
        don_vi = 4'd0;
    end
    else if(count == 6'd40) begin
        don_vi <= don_vi + 1;
        count <= 6'd0;
        if(don_vi == 4'd9) begin
            chuc <= chuc + 1; 
            don_vi <= 4'd0;
            if(chuc == 4'd9) begin
                chuc <= 4'd0;
            end
        end
    end
    else begin
        count <= count + 1;
    end
end
always@(posedge clk_in,posedge rst) begin
    if(rst) begin
        scan_an = 4'b1110;
    end
    else begin
        scan_an[1] <= ~scan_an[1];
        scan_an[0] <= ~scan_an[0];
    end
end
assign cnt_out = (scan_an[0] == 1'b0) ? don_vi: chuc;
endmodule
