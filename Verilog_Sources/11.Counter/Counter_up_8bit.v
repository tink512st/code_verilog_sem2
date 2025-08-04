module Counter_up_8bit(count,clk,rst);
input clk,rst;
output [7:0] count; // thanh ghi noi bo
// sau nay chu y ve quy uoc thanh ghi noi bo va ngoai vi
reg [7:0] count_temp;
always@(posedge clk) begin
	if(!rst)
		count_temp = 8'd0;
	else 
		count_temp = count_temp + 1;
end
assign count = count_temp;
endmodule