module USR(PO,SO,clk,rst,sel,SI,PI);
input clk,rst,SI;
input [1:0] sel;
input [4:0] PI;
output SO;
output reg [4:0] PO;

assign SO = (sel == 2'b01)? PO[4] : PO[0];
always @(posedge clk) begin
    if(rst)
        PO <= 5'd0;
    else begin
        case(sel) 
            2'b00: PO <= PO;
            2'b01: PO <= {PO[3:0], SI};
            2'b10: PO <= {SI,PO[4:1]};
            2'b11: PO <= PI;
        endcase
    end
end
endmodule
