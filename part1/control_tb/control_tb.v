`timescale 1ps/1ps
`include "control.v"

module control_tb;

reg [6:0] opcode;

wire branch;
wire mem_read;
wire mem_to_reg;
wire [1:0] alu_op;
wire mem_write;
wire alu_src;
wire reg_write;

control uut (.opcode(opcode), .branch(branch), .mem_read(mem_read) , .mem_to_reg(mem_to_reg) ,.alu_op(alu_op) 
            ,.mem_write(mem_write),.alu_src(alu_src),.reg_write(reg_write));

initial begin
$dumpfile("control_tb.vcd");
$dumpvars(0,control_tb);
#20
opcode=7'b0110011;
#20
opcode=7'b1100011;
#20
opcode=7'b0100011;
#20
opcode=7'b0000011;
#20
$display("********complete********");
end

endmodule
