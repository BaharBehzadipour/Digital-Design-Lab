`timescale 1ps/1ps
`include "register_file.v"

module register_file_tb;

reg [8:0] read_reg1;
reg [8:0] read_reg2;
reg [63:0] write_data;
reg [8:0] write_reg;
reg reg_write, En, Clk;
wire [63:0] read_data1;
wire [63:0] read_data2;

register_file uut (.read_reg1(read_reg1) , .read_reg2(read_reg2) , .write_reg(write_reg) , .write_data(write_data) 
                , .reg_write(reg_write) , .En(En) , .Clk(Clk) , .read_data1(read_data1) , .read_data2(read_data2));

initial begin
$dumpfile("register_file_tb.vcd");
$dumpvars(0,register_file_tb);
  #20
    read_reg1=2;
    read_reg2=1;
    write_data=59;
    write_reg=1;
    reg_write=0;
    En=0;
    Clk=0;
  #20

    read_reg1=2;
    read_reg2=1;
    write_data=59;
    write_reg=1;
    reg_write=1;
    En=1;
    Clk=1;
  #20

    read_reg1=2;
    read_reg2=1;
    write_data=128;
    write_reg=1;
    reg_write=1;
    En=1;
    Clk=0;
  #20

    read_reg1=2;
    read_reg2=1;
    write_data=128;
    write_reg=2;
    reg_write=1;
    En=1;
    Clk=1;
  #20

    read_reg1=2;
    read_reg2=1;
    write_data=128;
    write_reg=2;
    reg_write=1;
    En=1;
    Clk=0;
  #20
$display("********complete********");
end

endmodule
