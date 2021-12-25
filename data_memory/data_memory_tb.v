`timescale 1ps/1ps
`include "data_memory.v"

module data_memory_tb;

reg En, Clk;
reg [63:0] address;
reg [63:0] write_data;
reg memRead,memWrite;
wire [63:0] read_data;

data_memory uut (.En(En), .Clk(Clk), .address(address),.write_data(write_data),.memRead(memRead), .memWrite(memWrite), .read_data(read_data));

initial begin
$dumpfile("data_memory_tb.vcd");
$dumpvars(0,data_memory_tb);
#20
En=0;
Clk=0;
address=1;
write_data=258;
memRead=0;
memWrite=1;
#20
En=1;
Clk=1;
address=1;
write_data=258;
memRead=0;
memWrite=1;
#20
En=1;
Clk=0;
address=1;
write_data=258;
memRead=0;
memWrite=1;
#20
En=1;
Clk=1;
address=1;
write_data=258;
memRead=0;
memWrite=1;
#20

En=1;
Clk=0;
address=1;
write_data=258;
memRead=1;
memWrite=0;
#20
En=1;
Clk=1;
address=1;
write_data=258;
memRead=1;
memWrite=0;
#20
En=1;
Clk=0;
address=1;
write_data=258;
memRead=1;
memWrite=0;
#20
En=1;
Clk=1;
address=1;
write_data=258;
memRead=1;
memWrite=0;
#20

$display("********complete********");

end

endmodule
