`default_nettype none

module MEMWB(in, Read, En, Clk, out);

input [134:0] in;
input Read, En, Clk;
output reg [134:0] out;

reg [134:0] memory;

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

