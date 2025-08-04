module fifo_uart(thres_trig, overrun, underrun, empty, full, dout, din, thres_hold, clk, rst,push_in, pop_in, en);
input clk,rst,push_in,pop_in,en;
input [3:0] thres_hold;
input [7:0] din;
output [7:0] dout;
output empty, full, underrun, overrun, thres_trig;
logic push,pop;
reg [7:0] mem[63:0];
reg empty_t, full_t, underrun_t,overrun_t, thres_trig_t;
reg[3:0] waddr = 0;
//set co empty 
always@(posedge clk,posedge rst) 
	if(rst)
		empty_t <= 0;
	else 
		case({push,pop})
			2'b01: empty_t <= (~|waddr & ~en);
			2'b10: empty_t <= 1'b0;
			default: ;
		endcase
//set co full
always@(posedge clk,posedge rst) 
	if(rst)
		full_t <= 0;
	else 
		case({push,pop})
			2'b10: full_t <= (&waddr & ~en);
			2'b01: full_t <= 1'b0;
			default: ;
		endcase
// set gia tri cho pop va push
assign push = push_in & !full_t;
assign pop = pop_in & !empty_t;
//write address update
always@(posedge clk,posedge rst) 
	if(rst)
		waddr <= 0;
	else
		case({push,pop})
			2'b01: begin
				if(waddr!=4'h0 && ~empty_t)
					waddr <= waddr-1;
				else 
					waddr <= waddr;
			end
			2'b10: begin
				if(waddr!=4'bf && ~full_t)
					waddr <= waddr + 1;
				else	
					waddr <= waddr;
			end
			default: ;
		endcase
//memory update
always@(posedge clk) 
		case({push,pop})
			2'b01: begin
				dout <= mem[0];
				for(int i=0;i<15;i++) begin
					mem[i] <= mem[i+1];
				end
				mem[15] <= 0;
			end
			2'b10: begin
				mem[waddr] <= din;
			end
			2'b11: begin
				dout <= mem[0]
				for(int i=0;i<15;i++) begin
					mem[i] <= mem[i+1];
				end
				mem[15] <= 0;
				mem[waddr-1] <= din;
			end
			default: ;
		endcase
//set co underrun
always@(posedge clk,posedge rst) begin
	if(rst) begin
		underrun_t <= 0;
		overrun_t <= 0;
	end
	else begin
		if(push & full_t)
			overrun_t<= 1'b1;
		else 
			overrun_t <= 1'b0;
		if(pop & empty_t)
			underrun_t <= 1'b1;
		else	
			underrun_t <= 1'b0;
	end
end
always@(posedge clk ,posedge rst) 
	if(rst)
		thres_trig_t <= 0;
	else if(push ^ pop) begin
		thres_trig_t <= (waddr>=thres_hold)? 1'b1: 1'b0;
	end
assign empty = empty_t;
assign full = full_t;
assign underrun = underrun_t;
assign overrun = overrun_t;
assign thres_trig = thres_trig_t;
endmodule