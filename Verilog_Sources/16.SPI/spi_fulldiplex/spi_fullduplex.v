module spi_fullduplex(data,clk,rst,tx_en,miso,mosi,sclk,cs,dout,done_rx);
input clk,rst,tx_en;
input [7:0] data;
output reg mosi,cs;
output sclk;

input miso;
output [7:0] dout;
output reg done_rx;
parameter idle = 2'b00, tx_data = 2'b11;
reg [1:0] state;
reg [7:0] dout_t;
integer count = 0 ;
reg [1:0] ccount = 0;
reg spi_clk = 0;
//PHAN TRUYEN DU LIEU TREN MOSI DEN SLAVE
always@(posedge clk) 
	if(!rst && tx_en) begin
		if(ccount < 3)
			ccount <= ccount+1;
		else begin
			ccount <= 0;
			spi_clk <= ~spi_clk;
		end
	end
always@(posedge sclk or posedge rst) begin
	if(rst) begin
		state <= idle;
		count <= 0;
		done_rx <= 0;
		mosi <= 0;
		dout_t <= 0;
		cs<= 1;
	end
	else begin
		case(state)
			idle: begin
				cs <= 1;
				mosi <= 0;
				dout_t <= 0;
				done_rx <= 0;
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
					dout_t <= {dout_t[6:0],miso};
					count <= count + 1;
				end
				else begin
					done_rx <= 1;
					count <= 0;
					state <= idle;
					cs <= 1;
				end
			end
			default : state <= idle;
		endcase
	end
end
assign sclk = spi_clk;
assign dout = dout_t;
endmodule