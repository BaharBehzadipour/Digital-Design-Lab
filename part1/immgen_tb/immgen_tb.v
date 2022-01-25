`timescale 1ps/1ps
`include "immgen.v"

module immgen_tb;

reg  [63:0] input1;
wire [63:0] output1;

immgen uut (.input1(input1), .output1(output1));

initial begin
$dumpfile("immgen_tb.vcd");
$dumpvars(0,immgen_tb);
    #20
        input1=64'b0000011000000000000011010000000000010100000000000000000100000011;
    #20
$display("********complete********");
end

endmodule
