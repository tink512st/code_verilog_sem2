module single_port_ram_v4(q,clk,data_in,we,w_addr,r_addr);
input clk,we;
input [5:0] w_addr,r_addr;
input [7:0] data_in;
output [7:0] q;

reg [7:0] ram [63:0];
reg [5:0] read_addr_reg;
always@(posedge clk) begin
	if(we)
		ram[w_addr] <= data_in;
	read_addr_reg <= r_addr;
end
	assign q = ram[read_addr_reg];
endmodule