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
  in = 8'b01011001;
  Read =1'b0;
  En =1'b1;
  Clk =1'b0;
  #20
  in = 8'b01011001;
  Read =1'b1;
  En =1'b1;
  Clk =1'b1;
#20
  in = 8'b0100101;
  Read =1'b1;
  En =1'b0;
  Clk =1'b0;
#20
  in = 8'b0100101;
  Read =1'b1;
  En =1'b0;
  Clk =1'b1;
#20
  in = 8'b0100101;
  Read =1'b1;
  En =1'b1;
  Clk =1'b0;
#20
  in = 8'b0100101;
  Read =1'b1;
  En =1'b1;
  Clk =1'b1;
#20
  in = 8'b0100101;
  Read =1'b1;
  En =1'b1;
  Clk =1'b0;
#20
  in = 8'b0100101;
  Read =1'b0;
  En =1'b1;
  Clk =1'b1;
#20
  in = 8'b0100101;
  Read =1'b0;
  En =1'b1;
  Clk =1'b0;
#20
$display("********complete********");
end

endmodule
