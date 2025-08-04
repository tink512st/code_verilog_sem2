module top_shift_16_LED(clk,rst,test_manual,mode,LED);
input clk,rst,test_manual;
input [1:0] mode;
output [15:0] LED;
wire clk_out_wire;
    div_clk_from_100Mhz ic1(.clk(clk),.rst(rst),.sel_freq(2'b10),.clk_out(clk_out_wire));
    shift_16_led ic2(.clk_in(clk_out_wire),.rst(rst),.test_manual(test_manual),.mode(mode),.LED(LED));
endmodule
//------------------------------------------------------
module shift_16_led(clk_in,rst,test_manual,mode,LED);
input clk_in,rst,test_manual;
input [1:0] mode;
output reg [15:0] LED;

always@(posedge clk_in, posedge rst) begin
    if(rst) begin
        if(test_manual == 1'b0) begin
            LED <= 16'hffff;
        end     
        else begin
            case(mode)
                2'd0: LED <= 16'h8000;
                2'd1: LED <= 16'h0001;
                2'd2: LED <= 16'h0180;
                3'd3: LED <= 16'h8001;
            endcase
        end
    end
    else begin
        if(test_manual == 1'b0) LED <= ~LED; 
        else 
            case(mode)
                2'd0: begin
                    LED <= LED >> 1; //dich trai sang phai
                    if (LED == 16'h0001) LED <= 16'h8000;
                end
                2'd1: begin
                    LED <= LED << 1; //dich phai sang trai
                    if (LED == 16'h8000) LED <= 16'h0001;
                end
                2'd2: begin
                    LED[15:8] <= LED[15:8] << 1 ; //dich tu trong ra ngoai
                    LED[7:0] <= LED[7:0] >> 1 ;
                    if (LED == 16'h8001) LED <= 16'h0180;
                end
                2'd3: begin
                    LED[15:8] <= LED[15:8] >> 1 ; //dich tu ngoai vao trong
                    LED[7:0] <= LED[7:0] << 1 ;
                    if (LED == 16'h0180) LED <= 16'h8001;
                end
            endcase
    end
end

endmodule
//--------------------------------
module div_clk_from_100Mhz(clk,rst,sel_freq,clk_out);
input clk,rst;
input [1:0] sel_freq;
output reg clk_out;

parameter sys_freq = 100_000_000; // 100Mhz
parameter K_1Hz = 100_000_000;
parameter K_2Hz = 50_000_000;
parameter K_5Hz = 20_000_000; 
parameter K_10Hz = 10_000_000;

reg [25:0] counter = 1;
always@(posedge clk, posedge rst) begin
    if(rst) begin
        counter <= 1;
        clk_out <= 0;
    end
    else begin
        counter <= counter + 1;
        case(sel_freq) 
            2'd0: begin
                if(counter >= K_1Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
            2'd1: begin
                if(counter >= K_2Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
            2'd2: begin
                if(counter >= K_5Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
            2'd3: begin
                if(counter >= K_10Hz/2) begin
                    clk_out <= ~ clk_out;
                    counter <= 1;
                end
            end
        endcase
    end
end
endmodule
//---------------------------------------
`timescale 1ns / 1ps
module top_shift_16_LED_tb;
reg clk,rst,test_manual;
reg [1:0] mode;
wire [15:0] LED;

shift_16_led dut(clk,rst,test_manual,mode,LED);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    rst = 1; test_manual = 1; mode = 2'b00;
    repeat(5)@(posedge clk);
    rst = 0; 
    repeat(20)@(posedge clk);//dich sang phai 20 lan
    
    rst = 1; mode = 2'b01; 
    repeat(2)@(posedge clk);
    rst = 0;
    repeat(20)@(posedge clk);//dich sang trai 20 lan
    
    rst = 1; mode = 2'b10; 
    repeat(2)@(posedge clk);
    rst = 0;
    repeat(20)@(posedge clk);//dich trong ra ngoai 20 lan
    
    rst = 1; mode = 2'b11; 
    repeat(2)@(posedge clk);
    rst = 0;
    repeat(20)@(posedge clk);//dich ngoai vao trong 20 lan
    $stop;
end
endmodule
