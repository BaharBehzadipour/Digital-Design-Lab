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
`include "ALU_control.v"
`include "control.v"
`include "immgen.v"

module  Risc_v;

wire clk;
reg pc_reset,pc_write;
wire [63:0] new_pc=64'b0; //wire
/*reg [63:0] new_pc1; //wire*/
wire [63:0] old_pc;
wire [63:0] instruction;
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

/*initial begin
    pc_reset=1;
    #210 
    pc_reset=0;
    pc_write=1;
end*/

clock myclock(clk);
Register64 pc(.in(new_pc), .Read(pc_write), .En(pc_reset), .Clk(clk), .out(old_pc));

Instruction_memory instruction_memory(.data_in(64'b0), .address(old_pc), .enable(pc_reset),.clk(clk), 
                                .read(1'b1), .data_out(instruction));

Adder add(.a(old_pc), .b(64'b100), .sum(pcplus4));

immgen myimmgen(.input1(instruction), .output1(out_data));

control cu(.opcode(instruction[6:0]), .branch(branch), .mem_read(mem_read) , .mem_to_reg(mem_to_reg) ,.alu_op(alu_op) 
            ,.mem_write(mem_write),.alu_src(alu_src),.reg_write(reg_write));

Adder add2(.a(out_data), .b(old_pc), .sum(sum_data));

multiplexer mux(.data1(pcplus4), .data2(sum_data), .s(branch & alu_zero) , .data_out(new_pc));

register_file regfile(.read_reg1(instruction[19:15]) , .read_reg2(instruction[24:20]) , .write_reg(instruction[11:7]) 
, .write_data(write_data),.reg_write(reg_write) , .En(pc_reset) , .Clk(clk) , .read_data1(read_data1) , 
.read_data2(read_data2));

alu_control aluc(.func3(instruction[14:12]), .func7(instruction[30:24]), .alu_op(alu_op) , .result(result));

multiplexer mux2(.data1(read_data2), .data2(out_data), .s(alu_src) , .data_out(alu_src_mux_output));

alu alu(.in1(read_data1), .in2(alu_src_mux_output), .alu_c(result) , .zero(alu_zero) , .result(address));

data_memory uut (.En(pc_reset), .Clk(clk), .address(address),.write_data(read_data2),.memRead(mem_read), 
.memWrite(mem_write), .read_data(read_data));

multiplexer mux3(.data1(read_data), .data2(address), .s(mem_to_reg) , .data_out(write_data));

initial begin
$dumpfile("Risc_v.vcd");
$dumpvars(0,Risc_v);

#20
pc_reset=0;
pc_write=0;
/*new_pc1=64'b0;*/
#20
pc_reset=1;
pc_write=1;
/*new_pc1=64'b0;*/
#20
pc_reset=1;
pc_write=0;
/*new_pc1=64'b0;*/
#20
$display("********complete********");
$finish;
end

endmodule
