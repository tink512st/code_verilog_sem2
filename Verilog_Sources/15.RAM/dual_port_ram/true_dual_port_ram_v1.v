module true_dual_port_ram_v1(q_a,q_b,clk,data_a,data_b,we_a,we_b,a_addr,b_addr);
input clk,we_a,we_b;
input [5:0] a_addr,b_addr;
input [7:0] data_a,data_b;
output reg [7:0] q_a,q_b;

reg [7:0] ram [63:0];
always@(posedge clk) begin
	if(we_a) begin
		ram[a_addr] <= data_a;
		q_a <= data_a;
	end
	else
		q_a <= ram[a_addr];
end

always @(posedge clk) begin
	if(we_b) begin
		ram[b_addr] <= data_b;
		q_b <= data_b;
	end
	else 
		q_b<= ram[b_addr];
end
endmodule