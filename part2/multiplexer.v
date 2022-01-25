`default_nettype none

module multiplexer (data1, data2, s,data_out);

    input [63:0] data1;
    input [63:0] data2;
    input s;
    output [63:0] data_out;

    assign data_out = (s) ? data2 : data1;

endmodule