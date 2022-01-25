`timescale 1ps/1ps
`include "multiplexer.v"

module multiplexer_tb;

reg [63:0] data1;
reg [63:0] data2;
reg s;

wire [63:0] data_out;

multiplexer uut (.data1(data1) , .data2(data2) , .s(s) , .data_out(data_out));

initial begin
$dumpfile("multiplexer_tb.vcd");
$dumpvars(0,multiplexer_tb);
#20
data1=584;
data2=698;
s=1;
#20
data1=584;
data2=698;
s=0;
#20
$display("********complete********");

end

endmodule
