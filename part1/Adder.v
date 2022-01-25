`default_nettype none

module Adder (a, b, sum);
input [63:0] a;
input [63:0] b;
output [63:0] sum;
wire [63:0]carry;
genvar  k;

assign sum[0]=a[0]^b[0];
assign carry[0]=a[0]&b[0];
generate
for (k = 1; k < 64; k = k+1) begin
    assign  sum[k]=(a[k] ^ b[k] )^ carry[k-1];
    assign carry[k]=(a[k] & b[k]) |(a[k] & carry[k-1]) | (b[k] & carry[k-1]);
end
endgenerate

endmodule