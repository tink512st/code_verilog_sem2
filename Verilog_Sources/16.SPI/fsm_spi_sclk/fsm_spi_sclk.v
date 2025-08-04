module fsm_spi_sclk(clk,rst,tx_en,mosi,sclk,cs);
input clk,rst,tx_en;
output reg mosi,cs;
output sclk;

reg [7:0] data =8'b10101010;
parameter idle = 2'b00, tx_data = 2'b11;
reg [1:0] state;
integer count = 0 ;
reg [1:0] ccount = 0;
reg spi_clk = 0;
always@(posedge clk) 
	if(!rst && tx_en) begin
		if(ccount < 3)
			ccount <= ccount+1;
		else begin
			ccount <= 0;
			spi_clk <= ~spi_clk;
		end
	end

//////
always@(posedge sclk) begin
	case(state)
		idle: begin
			cs <= 1;
			mosi <= 0;
			if(!rst && tx_en) begin
				cs <= 0;
				state <= tx_data;
			end
			else 
				state <= idle;
		end
		tx_data: begin
			if(count < 8) begin
				mosi <= data[7-count];
				count <= count + 1;
			end
			else begin
				count <= 0;
				state <= idle;
				cs <= 1;
			end
		end
		default : state <= idle;
	endcase
end
assign sclk = spi_clk;
endmodule