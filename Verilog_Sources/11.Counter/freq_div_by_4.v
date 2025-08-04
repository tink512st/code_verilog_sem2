module freq_div_by_4(clk_out,clk,rst);
input clk,rst;
output reg clk_out;
reg clk_div2;
    always@(posedge clk or posedge(rst)) begin 
        if(rst)
            clk_div2 <= 0;
        else    
            clk_div2 <= ~clk_div2;
    end
    always@(posedge clk_div2  or posedge(rst)) begin 
        if(rst)
            clk_out <= 0;
        else    
            clk_out <= ~clk_out;
    end
endmodule