`default_nettype none

module EXMEM(in, Read, En, Clk, out);

input [202:0] in;
input Read, En, Clk;
output reg [202:0] out;

reg [202:0] memory;

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

