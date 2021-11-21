`timescale 1ps/1ps
`include "mux2_64bit.v"

module mux2_64bit_tb;

reg w0, w1, s;
wire f;

mux2_64bit uut (w0, w1, s, f)

initial 
begin
$dumpfile("mux2_64bit_tb.vcd")
$dumpvars(0,mux2_64bit_tb)
 
w0=0
w1=0
s=0
if(f==1)
  $display("test fail");
#20

w0=0
w1=1
s=0
if(f==1)
  $display("test fail");
#20


w0=1
w1=0
s=0
if(f==0)
  $display("test fail");
#20


w0=1
w1=1
s=0
if(f==0)
  $display("test fail");
#20


w0=0
w1=0
s=1
if(f==1)
  $display("test fail");
#20


w0=0
w1=1
s=1
if(f==0)
  $display("test fail");
#20


w0=1
w1=0
s=1
if(f==1)
  $display("test fail");
#20


w0=1
w1=1
s=1
if(f==0)
  $display("test fail");
#20

$display("test complete");
end

endmodule
