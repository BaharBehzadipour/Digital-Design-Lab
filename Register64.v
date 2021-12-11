`default_nettype none

module Register64 (in, Read, En, Clk, out);
input [63:0] in;
input Read, En, Clk;
output reg [63:0] out;
integer k;
always @(posedge Clk)
if (En)
begin
if(!Read)
begin
for (k = 0; k < 63; k = k+1)
out[k]=in[k+1];
end
else
begin 
   for (k = 0; k < 63; k = k+1)
out[k]=in[k+1]; 
end
end
endmodule

