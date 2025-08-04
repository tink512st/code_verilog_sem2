module sequense_001_moore(det,clk,rst,inp);
	input clk,rst,inp;
	output reg det;
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	reg [1:0] pre_sta, next_sta;
	always @(posedge clk, posedge rst) begin
		if(rst)
			pre_sta <= 0;
		else 
			pre_sta <= next_sta;
	end
	always @(inp,pre_sta) begin
		case(pre_sta)
			S0: if(inp) next_sta = S0;
				else next_sta = S1;
			S1: if(inp) next_sta = S0;
				else next_sta = S2;
			S2: if(inp) next_sta = S3;
				else next_sta = S2;
			S3: if(inp) next_sta = S0;
				else next_sta = S1;
			default: next_sta = S0;
		endcase
	end
	always @(inp,pre_sta) begin
		case(pre_sta)
			S0: det = 0;
			S1: det = 0;
			S2: det = 0;
			S3: det = 1;
			default: det = 0;
		endcase
	end
endmodule