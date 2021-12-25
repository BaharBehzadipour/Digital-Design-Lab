`default_nettype none

module alu (in1 , in2 , alu_c, zero,result);
 
input [63:0] in1;
input [63:0] in2;
input [3:0] alu_c;

output reg zero;
output reg [63:0] result;

reg [63:0] memory[0:63];

always @(in1 , in2 , alu_c)
begin
   
   if (alu_c == 4'b0010)
        result=in1+in2;
   else if (alu_c == 4'b0110)
        result=in1-in2;
   else if (alu_c == 4'b0000) 
        result=in1&in2;
   else if (alu_c == 4'b0001) 
        result=in1|in2;

    zero= (result == 0)? 1 :0;
  
end

   
endmodule