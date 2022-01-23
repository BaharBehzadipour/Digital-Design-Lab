`default_nettype none

module data_memory (En, Clk,address,write_data,memRead,memWrite,read_data);

input En, Clk;
input [63:0] address;
input [63:0] write_data;
input memRead,memWrite;
output reg [63:0] read_data;

integer k;
reg [63:0] memory[63:0];

always @(posedge Clk)
   if (En)
   begin

      if(memWrite)
      begin
         memory[address]=write_data;
      end
      
      if(memRead)
      begin 
         read_data=memory[address];
      end

   end
endmodule

