module single_port_ram_v3(q,clk,data_in,we,addr);
input clk,we;
input [5:0] addr;
input [7:0] data_in;
output [7:0] q;

reg [5:0] addr_reg;
reg [7:0] ram [63:0];
always@(posedge clk) begin
	if(we)
		ram[addr] <= data_in;
	addr_reg <= addr;
end
	assign q = ram[addr_reg];
endmodule