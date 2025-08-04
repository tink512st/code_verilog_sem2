module Counter_up_8bit_tb;
reg clk,rst;
wire [7:0] count; 

Counter_up_8bit uut1(count,clk,rst);

always #5 clk = ~clk;

initial begin   
    clk = 0; rst = 1; #10;
    rst = 0; #10;
    rst = 1; #100;
    $stop;
end
endmodule