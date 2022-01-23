`default_nettype none

module alu_control (func3 , func7 ,alu_op, result);
 
input [2:0] func3;
input [6:0] func7;
input [1:0] alu_op;
output reg [3:0] result;

reg [11:0] a;

always @(*)
begin
    a = {alu_op,func3,func7};
    if(alu_op==2'b00)
        result=4'b0010;
    if(alu_op==2'b01)
        result=4'b0110;
  casex (a)
   12'b101110000000: result=4'b0000; // &
   12'b101100000000: result=4'b0001; // |
   12'b100000000000: result=4'b0010; // +
   12'b100000100000: result=4'b0110; // -
  default: result=4'b0010;
  endcase
  
end

   
endmodule