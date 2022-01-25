`default_nettype none

module Instruction_memory (data_in, address, enable,read,data_out);/*,clk*/

    input [31:0] data_in;
    input [63:0] address;
    input enable;
    /*input clk;*/
    input read; //read or write
    output reg [31:0] data_out;

    reg [31:0] memory[0:256];

    initial begin
        memory[0] = 32'b00000000000001010010101000000011;
        memory[4] = 32'b00000001010000000000101010110011;
        memory[8] = 32'b0100001010010101000001100110011;
        memory[12] = 32'b00000001010001010010010000100011 ;
        memory[16] = 32'b11111111010110100000111001100111 ;
    end
    /*always @(posedge clk)*/
    always @(*)
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