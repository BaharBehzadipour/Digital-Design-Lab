`default_nettype none

module register_file (read_reg1 , read_reg2 , write_reg , write_data , reg_write , En , Clk , read_data1,read_data2);
 
input [4:0] read_reg1;
input [4:0] read_reg2;
input [63:0] write_data;
input [4:0] write_reg;
input reg_write, En, Clk;
output reg [63:0] read_data1;
output reg [63:0] read_data2;
reg [63:0] memory[0:63];
integer k;

initial begin
    for (k = 0; k < 64; k = k+1) begin
        memory[k]=0;
    end
end

always @(posedge Clk)
begin
   if (En)
   begin

      if(reg_write) //write
         memory[write_reg] = write_data;

   end
   read_data1 = memory[read_reg1];
   read_data2 = memory[read_reg2];
   end

   
endmodule