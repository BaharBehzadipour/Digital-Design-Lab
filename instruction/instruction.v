`default_nettype none

module Instruction_memory (data_in, address, enable,clk,read,data_out);

    input [63:0] data_in;
    input [63:0] address;
    input enable;
    input clk;
    input read; //read or write
    output reg [63:0] data_out;

    reg [63:0] memory[0:1023];

    always @(posedge clk)
    if (enable)
    begin

    if(!read) //write
    begin
        memory[address] = data_in;  
    end

    else //read
    begin 
        data_out= memory[address] ;
    end

    end

endmodule
