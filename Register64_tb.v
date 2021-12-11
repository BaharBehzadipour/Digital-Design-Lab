`timescale 1ps/1ps
`include "Register64.v"

module Register64_tb;

reg  [63:0] in;
reg  Read, En, Clk;
wire [63:0] out;

Register64 uut (.in(in), .Read(Read), .En(En) , .Clk(Clk) , .out(out));

initial begin
$dumpfile("Register64_tb.vcd");
$dumpvars(0,Register64_tb);
#20
if(in==out)
    $display("OK");

#20
$display("********complete********");
end

endmodule
