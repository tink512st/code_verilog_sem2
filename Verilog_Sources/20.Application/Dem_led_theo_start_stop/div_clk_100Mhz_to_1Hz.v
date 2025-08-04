module div_clk_100Mhz_to_1Hz(clk_in,rst,clk_out,sel_freq);
input clk_in,rst,sel_freq;
output reg clk_out;
parameter K1 = 100000000; // he so chia 1Hz la 100M 
parameter M1 = 26;        // chua trong 26 bit
parameter K2 = 10000000;  // he so chia 10Hz la 10M
parameter M2 = 23;        // chua trong 23 bit
reg [M1-1:0] counter1;
reg [M2-1:0] counter2;
initial begin
	clk_out = 0;
	counter1 = 1;
	counter2 = 1;
end

always@(posedge clk_in, posedge rst) begin
	if(rst) begin
		clk_out <= 0;
		counter1 = 1;
	    counter2 = 1;
	end
    else if(sel_freq == 1'b1) begin
        if(counter1 >= K1/2) begin
            counter1 <= 1;
            clk_out <= ~clk_out;
        end 
        else 
            counter1 <= counter1 + 1;
    end
    else if(sel_freq == 1'b0) begin
        if(counter2 >= K2/2) begin
            counter2 <= 1;
            clk_out <= ~clk_out;
        end
        else 
            counter2 <= counter2 + 1;
    end
end
endmodule