`default_nettype none

module Register64 (in, Read, En, Clk, out);

input [63:0] in;
input Read, En, Clk;
output reg [63:0] out;
integer k;

reg [63:0] memory;

always @(posedge Clk)
   if (En)
   begin
      if(!Read)
      begin
         memory = in;
      end
      
      else
      begin 
         out = in;
      end
   end
endmodule

