`default_nettype none

module Register64 (in, Read, En, Clk, out);

input [63:0] in;
input Read, En, Clk;
output reg [63:0] out;

reg [63:0] memory;
integer i=0;

always @(posedge Clk)
   if (En)
   begin
      if(i==0)
      begin
         out=64'b0;
      end
      if(i!=0)
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
      i=i+1;
   end
endmodule

