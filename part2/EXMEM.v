`default_nettype none

module EXMEM(in, Read, En, Clk, out);

input [202:0] in;
input Read, En, Clk;
output reg [202:0] out;

reg [202:0] memory;

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
            out = 202'b0;
         end
         i=i+1;
   end
endmodule

