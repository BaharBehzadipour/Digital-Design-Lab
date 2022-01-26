`default_nettype none

module IFID(in, Read, En, Clk, out);

input [95:0] in;
input Read, En, Clk;
output reg [95:0] out;

reg [95:0] memory;

integer i=0;
always @(posedge Clk)
   if (En)
   begin
         if(!Read) //write
         begin
            memory = in;
         end

         if(Read && i!=0) //read
         begin 
            out = in;
         end
         if(Read && i==0) //read
         begin 
            out = 95'b0;
         end
         i=i+1;
   end
endmodule

