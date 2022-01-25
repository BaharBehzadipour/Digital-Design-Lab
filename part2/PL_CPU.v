`default_nettype none
`timescale 1ps/1ps
`include "Adder.v"
`include "instruction.v"
`include "Register64.v"
`include "ALU.v"
`include "register_file.v"
`include "data_memory.v"
`include "clock.v"
`include "multiplexer.v"
`include "multiplexer2.v"
`include "ALU_control.v"
`include "control.v"
`include "immgen.v"
`include "IFID.v"
`include "IDEX.v"
`include "EXMEM.v"
`include "MEMWB.v"

module  PL_CPU;

wire clk;
reg pc_reset,pc_write;
wire [63:0] new_pc; 
wire [63:0] old_pc;

wire [31:0] instruction;

wire [63:0] pcplus4;
wire [3:0]result;
wire alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch;
wire [1:0] alu_op;
wire [63:0] read_data1;
wire [63:0] read_data2;
wire [63:0] read_data;
wire [63:0] out_data;
wire alu_zero;
wire [63:0] sum_data;
wire [63:0] alu_src_mux_output;
wire [63:0] address;
wire [63:0] write_data;

wire [95:0] register1_output;
wire [271:0] register2_output;
wire [202:0] register3_output;
wire [134:0] register4_output;

initial begin
    pc_reset=1;
    pc_write=0;
end

//*************************  STAGE 1  *********************************

clock myclock(clk);

Register64 pc(.in(new_pc), .Read(pc_write), .En(pc_reset), .Clk(clk), .out(old_pc));

Instruction_memory instruction_memory(.data_in(32'b0), .address(old_pc), .enable(pc_reset),
                                .read(1'b1), .data_out(instruction));
Adder add(.a(old_pc), .b(64'b100), .sum(pcplus4));

multiplexer2 mux(.data1(pcplus4), .data2(register3_output[197:134]), .s(register3_output[200:200] & 
register3_output[133:133]) , .data_out(new_pc));

IFID register1(.in({old_pc,instruction}), .Read(pc_write), .En(pc_reset), .Clk(clk), .out(register1_output));

//*************************  STAGE 2  *********************************

register_file regfile(.read_reg1(register1_output[19:15]) , .read_reg2(register1_output[24:20]) , 
.write_reg(register4_output[4:0]) 
, .write_data(write_data),.reg_write(register4_output[134:134]) , .En(pc_reset) , .Clk(clk) , .read_data1(read_data1) , 
.read_data2(read_data2));

immgen myimmgen(.input1(register1_output[31:0]), .output1(out_data));

control cu(.opcode(register1_output[6:0]), .branch(branch), .mem_read(mem_read) , .mem_to_reg(mem_to_reg) 
,.alu_op(alu_op),.mem_write(mem_write),.alu_src(alu_src),.reg_write(reg_write));

IDEX register2(.in({reg_write,mem_to_reg,branch,mem_read,mem_write,alu_op,alu_src,register1_output[95:32],read_data1
,read_data2,out_data,register1_output[14:12],register1_output[11:7]}), .Read(pc_write), 
.En(pc_reset), .Clk(clk), .out(register2_output));

//*************************  STAGE 3  *********************************

Adder add2(.a(register2_output[71:8]), .b(register2_output[263:200]), .sum(sum_data));

alu_control aluc(.func3(register2_output[7:5]), .func7(register1_output[30:24]), .alu_op(register2_output[266:265]) 
, .result(result));

multiplexer mux2(.data1(register2_output[135:72]), .data2(register2_output[71:8]), 
.s(register2_output[264:264]) , .data_out(alu_src_mux_output));

alu alu(.in1(register2_output[199:136]), .in2(alu_src_mux_output), .alu_c(result) , .zero(alu_zero) , 
.result(address));

EXMEM register3(.in({ register2_output[271:270],register2_output[269:267],sum_data,alu_zero,address,register2_output[135:72],
register2_output[4:0]}), .Read(pc_write), .En(pc_reset), .Clk(clk), 
.out(register3_output));

//*************************  STAGE 4  *********************************

data_memory uut (.En(pc_reset), .Clk(clk), .address(register3_output[132:69]),.write_data(register3_output[68:5])
,.memRead(register3_output[199:199]),.memWrite(register3_output[198:198]), .read_data(read_data));

MEMWB register4(.in({register3_output[202:201],read_data,register3_output[132:69],register3_output[4:0]}), 
.Read(pc_write), .En(pc_reset), .Clk(clk), .out(register4_output));

//*************************  STAGE 5  *********************************

multiplexer mux3(.data1(register4_output[132:69]), .data2(register4_output[68:5]), .s(register4_output[133:133]) 
, .data_out(write_data));


initial begin
$dumpfile("PL_CPU.vcd");
$dumpvars(0,PL_CPU);
pc_reset=1;
pc_write=1;
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
#20
$display("********complete********");
$finish;
end
endmodule
