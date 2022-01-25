`default_nettype none

module IFID(in, Read, En, Clk, out);

input [95:0] in;
input Read, En, Clk;
output reg [95:0] out;

reg [95:0] memory;

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

