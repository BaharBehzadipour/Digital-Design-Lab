`timescale 1ps/1ps
`include "Adder.v"

module Adder_tb;

reg  [63:0] a;
reg  [63:0] b;

wire [63:0]sum;

Adder uut (.a(a), .b(b), .sum(sum));

initial begin
$dumpfile("Adder_tb.vcd");
$dumpvars(0,Adder_tb);
#20
a=2;
b=5;
#20
a=65;
b=3;
#20
a=258;
b=36;
#20
$display("********complete********");

end

endmodule
