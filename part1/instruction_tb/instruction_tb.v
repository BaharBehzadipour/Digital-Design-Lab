`timescale 1ps/1ps
`include "instruction.v"

module Instruction_tb;


reg [63:0] data_in;
reg [63:0] address;
reg enable;
reg clk;
reg read; //read or write

wire [63:0] data_out;

Instruction_memory uut (.data_in(data_in), .address(address), .enable(enable),.clk(clk), .read(read), .data_out(data_out));

initial begin
$dumpfile("Instruction_tb.vcd");
$dumpvars(0,Instruction_tb);
data_in=15;
address=1;
 enable=0;
 clk=0;
read=0;
#20
#20
data_in=15;
address=1;
 enable=1;
 clk=1;
read=0;
#20
data_in=17;
address=1;
 enable=1;
 clk=0;
read=0;
#20
data_in=17;
address=1;
 enable=1;
 clk=1;
read=1;
#20
data_in=17;
address=1;
 enable=1;
 clk=0;
read=1;
#20
data_in=17;
address=1;
 enable=1;
 clk=1;
read=1;
#20
data_in=17;
address=1;
 enable=1;
 clk=0;
read=0;
#20
data_in=20;
address=1;
 enable=1;
 clk=1;
read=0;
#20
data_in=20;
address=1;
 enable=1;
 clk=0;
read=0;
#20
data_in=20;
address=1;
 enable=1;
 clk=1;
read=1;
#20
data_in=20;
address=1;
 enable=1;
 clk=0;
read=1;
#20
$display("********complete********");

end

endmodule
