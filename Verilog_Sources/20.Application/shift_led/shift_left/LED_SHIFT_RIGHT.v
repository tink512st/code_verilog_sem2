module LED_SHIFT_LEFT(clk,rst,LED);
input clk,rst;
output reg [15:0] LED;

always@(posedge clk, posedge rst) begin
    if(rst)
        LED <= 16'h0001;
    else if( LED == 16'h8000)
        LED <= 16'h0001; 
    else 
        LED <= LED << 1;
end
endmodule