module single_port_ram_v1(q,clk,data_in,we,w_addr,r_addr);
input clk,we;
input [5:0] w_addr,r_addr;
input [7:0] data_in;
output reg [7:0] q;

reg [7:0] ram [63:0];
always@(posedge clk) begin
	if(we)
		ram[w_addr] <= data_in;
	q <= ram[r_addr];
end
endmodule