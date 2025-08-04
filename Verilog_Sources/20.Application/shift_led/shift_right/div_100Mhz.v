module div_clk_100Mhz_to_1Hz(clk_in,rst,clk_out);
input clk_in,rst;
output reg clk_out;

parameter K = 100000000; //100Mhz
parameter M = 26;
reg [M-1:0] counter;
initial begin
	clk_out = 0;
	counter = 1;
end
always@(posedge clk_in, posedge rst) begin
	if(rst) begin
		clk_out <= 0;
		counter <= 1;
	end
	else if( counter >= K/2) begin
		counter <= 1;
		clk_out <= ~clk_out;
	end
	else 
		counter <= counter + 1;
end
endmodule