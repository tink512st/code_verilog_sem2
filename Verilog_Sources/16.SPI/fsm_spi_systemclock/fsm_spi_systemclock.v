module fsm_spi_systemclk(mosi,cs,sclk,clk,rst,tx_en);
input clk,rst,tx_en;
output reg mosi;
output reg cs;
output sclk;

integer bit_count = 0;
reg [2:0] count =0;
reg spi_clk = 0;

parameter idle = 2'b00, start = 2'b01, tx_data = 2'b10, end_tx = 2'b11;
reg [1:0] state, next_state;
reg [7:0] din = 8'hfe;
//khoi tuan tu cho trang thai hien tai
always@(posedge clk) 
	if(rst)
		state <= idle;
	else 
		state <= next_state;
// khoi tao xung sclk cho spi
always @(posedge clk) begin
	case(state) 
		idle: begin
			count <= 0;
		end
		start: begin
			if(count <3'b011 || count == 3'b111)
				spi_clk <= 1;
			else 
				spi_clk <= 0;
		end
		tx_data: begin
			if(count <3'b011 || count == 3'b111)
				spi_clk <= 1;
			else 
				spi_clk <= 0;
		end
		end_tx: begin
			if(count <3'b011 || count == 3'b111)
				spi_clk <= 1;
			else 
				spi_clk <= 0;
		end
		default : spi_clk <= 1'b0;
	endcase
end
//khoi tang gia count tao xung bang 1/8 xung he thong
always@(posedge clk) begin
	case(state) 
		idle: begin
			count <= 0;
			bit_count <= 0;
		end
		start: begin
			count <= count + 1;
		end
		tx_data: begin
			if(bit_count != 8) begin
				if(count < 7) 
					count <= count + 1;
				else begin
					bit_count <= bit_count + 1;
					count <= 0;
				end
			end
		end
		end_tx:
			count <= count + 1;
		default : next_state <= idle;
	endcase
end
// khoi doc xac dinh trang thai va truyen du lieu
always@(*) begin
	case(state)
		idle: begin
			cs = 1;
			mosi = 0;
			if(tx_en)
				next_state = start;
			else 
				next_state = idle;
		end
		start: begin
			cs = 0;
			if(count < 7)	
				next_state = start;
			else
				next_state = tx_data;
		end
		tx_data: begin
			mosi = din[7-bit_count];
			if(bit_count!=8) 
				next_state = tx_data;
			else begin
				next_state = end_tx;
				mosi = 0;
			end
		end
		end_tx: begin
			cs = 1;
			if(count == 3'b111)
				next_state = idle;
			else 
				next_state = end_tx;
		end
		default : next_state = idle;
	endcase
end
assign sclk = spi_clk;
endmodule