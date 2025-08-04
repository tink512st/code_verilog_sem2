`timescale 1ns / 1ps
 
module i2c_top(
input clk, rst, newd, op, stretch,
input [6:0] addr,
input [7:0] din,
output [7:0] dout,
output busy,ack_err,
output done
);
wire sda, scl;
wire ack_errm, ack_errs;
 
i2c_master master (dout,sda,scl,done,ack_errm,busy,clk,rst,din,newd,addr,op);
i2c_Slave slave (.clk(clk),.rst(rst),.stretch(stretch),.sda(sda),.scl(scl),.ack_err(ack_errs),.done() );
 
assign ack_err = ack_errs | ack_errm;
 
 
endmodule
 
