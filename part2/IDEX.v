`default_nettype none

module IDEX(in, Read, En, Clk, out);

input [271:0] in;
input Read, En, Clk;
output reg [271:0] out;

reg [271:0] memory;

always @(posedge Clk)
   if (En)
   begin

         if(!Read) //write
         begin
            memory = in;
         end

         else //read
         begin 
            out = in;
         end
   end
endmodule

