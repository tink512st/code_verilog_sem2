module detector_RGB_ball_mealy_overlap(det,clk,rst,inp);
input clk,rst;
input [1:0] inp;
output reg det;
parameter RS = 4'b0000,
		  G = 4'b0001,
		  B = 4'b0010,
		  R = 4'b0011,
		  GR = 4'b0100,
		  GB = 4'b0101,
		  BG = 4'b0110,
		  BR = 4'b0111,
		  RB = 4'b1000,
		  RG = 4'b1001;
parameter GC = 2'b00, BC = 2'b01, RC = 2'b10;
reg [3:0] pre_sta, nxt_sta;
always@(posedge clk)
	if(rst)
		pre_sta <= 4'b0000;
	else pre_sta <= nxt_sta;

always@(inp,pre_sta) begin
	case(pre_sta)
		RS: if(inp == GC) nxt_sta = G;
			else if(inp == BC) nxt_sta = B;
			else if(inp == RC) nxt_sta = R;
		G: if(inp == GC) nxt_sta = G;
			else if(inp == BC) nxt_sta = GB;
			else if(inp == RC) nxt_sta = RG;
		B: if(inp == GC) nxt_sta = GB;
			else if(inp == BC) nxt_sta = B;
			else if(inp == RC) nxt_sta = BR;
		R: if(inp == GC) nxt_sta = RG;
			else if(inp == BC) nxt_sta = BR;
			else if(inp == RC) nxt_sta = R;
		GR: if(inp == GC) nxt_sta = RG;
			else if(inp == BC) nxt_sta = RB;
			else if(inp == RC) nxt_sta = R;
		GB: if(inp == GC) nxt_sta = BG;
			else if(inp == BC) nxt_sta = B;
			else if(inp == RC) nxt_sta = BR;
		BG: if(inp == GC) nxt_sta = G;
			else if(inp == BC) nxt_sta = GB;
			else if(inp == RC) nxt_sta = GR;
		BR: if(inp == GC) nxt_sta = RG;
			else if(inp == BC) nxt_sta = RB;
			else if(inp == RC) nxt_sta = R;
		RB: if(inp == GC) nxt_sta = BG;
			else if(inp == BC) nxt_sta = B;
			else if(inp == RC) nxt_sta = BR;
		RG: if(inp == GC) nxt_sta = G;
			else if(inp == BC) nxt_sta = GB;
			else if(inp == RC) nxt_sta = GR;
		default: nxt_sta = RS;
	endcase
end
always@(inp,pre_sta) begin
    case(pre_sta)
		GR: if(inp == GC) det = 0;
			else if(inp == BC) det = 1;
			else if(inp == RC) det = 0;
		GB: if(inp == GC) det = 0;
			else if(inp == BC) det = 0;
			else if(inp == RC) det = 1;
		BG: if(inp == GC) det = 0;
			else if(inp == BC) det = 0;
			else if(inp == RC) det = 1;
		BR: if(inp == GC) det = 1;
			else if(inp == BC) det = 0;
			else if(inp == RC) det = 0;
		RB: if(inp == GC) det = 1;
			else if(inp == BC) det = 0;
			else if(inp == RC) det = 0;
		RG: if(inp == GC) det = 0;
			else if(inp == BC) det = 1;
			else if(inp == RC) det = 0;
		default : det = 0;
	endcase
end
endmodule