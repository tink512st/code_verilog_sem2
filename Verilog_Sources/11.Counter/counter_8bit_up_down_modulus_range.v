module counter_8bit_up_down_modulus_range(count,clk,rst,load,data,u_d);
input clk,rst,load,u_d;
input [7:0] data;
output [7:0] count;

reg [7:0] count_temp;
always @(posedge clk) begin
	if(!rst | count_temp > 8'd40 | count_temp < 8'd10) 
	   count_temp <= 8'd10;
	else if(load)
	   count_temp <= data;
	else if(u_d)
	   count_temp <= (count_temp >= 40) ? 8'd10: count_temp + 1;
	else 
	   count_temp <= (count_temp <= 10) ? 8'd40: count_temp - 1;
end

assign count = count_temp;
endmodule