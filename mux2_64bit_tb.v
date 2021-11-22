`timescale 1ps/1ps
`include "mux2_64bit.v"

module mux2_64bit_tb;
reg [63:0]w0, [63:0]w1, s;
wire [63:0]f;

mux2_64bit uut (.w0(w0), .w1(w1), .s(s) , .f(f));

initial begin
$dumpfile("mux2_64bit_tb.vcd");
$dumpvars(0,mux2_64bit_tb);

s=0;
if(f!=w0)
  $display("test fail");
#20

s=1;
if(f!=w1)
  $display("test fail");
#20

$display("********complete********");
end

endmodule
