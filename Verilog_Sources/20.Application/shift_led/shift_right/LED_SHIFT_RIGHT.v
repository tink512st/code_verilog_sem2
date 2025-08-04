module LED_SHIFT_RIGHT(clk,rst,LED);
input clk,rst;
output reg [15:0] LED;

always@(posedge clk, posedge rst) begin
    if(rst)
        LED <= 16'h8000;
    else if( LED == 16'h0001)
        LED <= 16'h8000; 
    else 
        LED <= LED >> 1;
end
endmodule