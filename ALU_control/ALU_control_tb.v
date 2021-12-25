`timescale 1ps/1ps
`include "ALU_control.v"

module ALU_control_tb;


reg [2:0] func3;
reg [6:0] func7;
reg [1:0] alu_op;
wire [3:0] result;


alu_control uut (.func3(func3), .func7(func7), .alu_op(alu_op) , .result(result));

initial begin
$dumpfile("ALU_control_tb.vcd");
$dumpvars(0,ALU_control_tb);
  #20
func3=3'b000;
func7=7'b0100000;
alu_op=2'b10;
  #20
func3=3'b000;
func7=7'b0000000;
alu_op=2'b10;
  #20
func3=3'b110;
func7=7'b0000000;
alu_op=2'b10;
#20
$display("********complete********");
end

endmodule
