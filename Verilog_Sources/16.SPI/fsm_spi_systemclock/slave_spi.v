module slave_spi(sclk,mosi,cs,dout,done);
input sclk,mosi, cs;
output [7:0] dout;
output reg done;

integer bit_count = 0;
reg [7:0] data;
parameter idle = 2'b00, transfer = 2'b01;
reg [1:0] state;
always@(negedge sclk) begin
	case (state) 
		idle: begin
			done <= 0;
			data <= 0;
			if(!cs)
				state <= transfer;
			else 
				state <= idle;
		end
		transfer: begin
			if(bit_count < 8) begin
				bit_count <= bit_count + 1;
				data <={data[6:0],mosi};
				state <= transfer;
			end
			else begin
				bit_count <= 0;
				state <= idle;
				done <= 1;
			end
		end
		default: state <= idle;
	endcase
end
assign dout = data;
endmodule