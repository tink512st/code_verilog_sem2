module dual_port_ram_v2(q,clk,data_in,we,addr);
input w_clk,r_clk,we;
input [5:0] w_addr,r_addr;
input [7:0] data_in;
output [7:0] q;

reg [7:0] ram [63:0];
reg [5:0] read_addr_reg; 
always@(posedge w_clk)
	if(we)
		ram[w_addr] <= data_in;
always@(posedge r_clk)
	q <= ram[read_addr_reg];
	read_addr_reg <= r_addr;
endmodule