module fsm_spi_tb;
 
reg clk = 0,rst = 0,tx_en = 0;
wire mosi;
wire cs;
wire sclk;
    
    always #5 clk = ~clk;
    
    initial begin
    rst = 1;
    repeat(5) @(posedge clk);
    rst = 0;
    end
 
    initial begin
    tx_en = 0;
    repeat(5) @(posedge clk);
    tx_en = 1;
    end
 
fsm_spi dut (mosi,cs,sclk,clk,rst,tx_en);
 
endmodule