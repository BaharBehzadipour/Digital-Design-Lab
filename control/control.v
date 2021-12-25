`default_nettype none

module control (opcode , branch , mem_read , mem_to_reg , alu_op , mem_write , alu_src , reg_write);
 
input [6:0] opcode;

output reg branch;
output reg mem_read;
output reg mem_to_reg;
output reg [1:0] alu_op;
output reg mem_write;
output reg alu_src;
output reg reg_write;

always @(opcode)
begin
if(opcode==7'b0110011)begin
      branch = 0;
      mem_read = 0;
      mem_to_reg = 0;
      mem_write = 0;
      alu_src = 0;
      reg_write = 1;
      alu_op[0] = 0;
      alu_op[1] = 1;
      
end

if(opcode==7'b1100011)begin
      branch = 1;
      mem_read = 0;
      mem_to_reg = 1'bx;
      mem_write = 0;
      alu_src = 0;
      reg_write = 0;
      alu_op[0] = 1;
      alu_op[1] = 0;
      
end

if(opcode==7'b0100011)begin
      branch = 0;
      mem_read = 0;
      mem_to_reg = 1'bx;
      mem_write = 1;
      alu_src = 1;
      reg_write = 0;
      alu_op[0] = 0;
      alu_op[1] = 0;
      
end

if(opcode==7'b0000011)begin
      branch = 0;
      mem_read = 1;
      mem_to_reg = 1;
      mem_write = 0;
      alu_src = 1;
      reg_write = 1;
      alu_op[0] = 0;
      alu_op[1] = 0;
      
end
  
end

   
endmodule