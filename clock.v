`default_nettype none
`timescale 1ps/1ps

module clock (clk);
output reg CLK;

always
begin
    CLK=0;
    #20;
    CLK=1;
    #20;

endmodule
