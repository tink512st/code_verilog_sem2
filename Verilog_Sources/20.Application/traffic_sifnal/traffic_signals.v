module traffic_signals(clk_in,rst,pole1,pole2,count);
input clk_in,rst;
output reg [2:0] pole1,pole2;
output reg [3:0] count;
initial begin
    count = 0;
	pole1[0] = 1;
	pole1[1] = 0;
	pole1[2] = 0;
	
	pole2[0] = 0;
	pole2[1] = 0;
	pole2[2] = 1;
end
parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
reg [2:0] state = 2'b00;
reg check = 0;
always@(posedge clk_in, posedge rst) begin
	if(rst) begin
		pole1 <= 3'b100;
		pole2 <= 3'b001;
		count <= 0;
		check = 0;
	end
	else begin
		case(state) 
			A: begin
				pole1 <= 3'b100;
				pole2 <= 3'b001;
				if(count >= 3 & check == 1'b1) begin
				    count <= 0;
				    check <= 0;
				end
				else if(count >= 9) begin
					state <= B;
					count <= 8'd15;
					check <= 1;
				end
				else begin
					state <= A;
					count <= count + 1;
				end
			end
			
			B: begin
				pole1 <= 3'b100;
				pole2 <= 3'b010;
				if(count >= 9 & check == 1'b1) begin
				    count <= 0;
				    check <= 0;
				end
				else if(count >= 3) begin
					state <= C;
					check <= 1;
					count <= 8'd15;
				end
				else begin
					state <= B;
					count <= count + 1;
				end
			end
			
			C: begin
				pole1 <= 3'b001;
				pole2 <= 3'b100;
				if(count >= 3 & check == 1'b1) begin
				    count <= 0;
				    check <= 0;
				end
				else if(count >= 9) begin
					state <= D;
					check <= 1;
					count <= 8'd15;
				end
				else begin
					state <= C;
					count <= count + 1;
				end
			end
			
			D: begin
				pole1 <= 3'b010;
				pole2 <= 3'b100;
				if(count >= 9 & check == 1'b1) begin
				    count <= 0;
				    check <= 0;
				end
				else if(count >= 3) begin
					state <= A;
					check <= 1;
					count <= 8'd15;
				end
				else begin
					state <= D;
					count <= count + 1;
				end
			end
		endcase
	end
end
endmodule