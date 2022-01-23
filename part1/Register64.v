`default_nettype none

module Register64 (in, Read, En, Clk, out);

input [63:0] in;
input Read, En, Clk;
output reg [63:0] out;

reg [63:0] memory;

always @(posedge Clk)
   if (En)
   begin
      if(!Read) //write
      begin
         memory = in;
      end

      else //read
      begin 
         out = memory;
      end
   end
endmodule

