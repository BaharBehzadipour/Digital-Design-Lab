`timescale 1ps/1ps
`include "ALU.v"

module ALU_tb;

reg  [63:0] in1;
reg  [63:0] in2;
reg  [3:0] alu_c;

wire zero;
wire [63:0] result;


alu uut (.in1(in1), .in2(in2), .alu_c(alu_c) , .zero(zero) , .result(result));

initial begin
$dumpfile("ALU_tb.vcd");
$dumpvars(0,ALU_tb);
  #20
in1=0;
in2=0;
alu_c=0;
#20
in1=6;
in2=23;
alu_c=1;
#20
in1=6;
in2=8;
alu_c=2;
#20
in1=6;
in2=5;
alu_c=3;
#20
$display("********complete********");
end

endmodule
