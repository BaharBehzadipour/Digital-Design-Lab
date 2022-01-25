`default_nettype none

module multiplexer2 (data1, data2, s,data_out);

    input [63:0] data1;
    input [63:0] data2;
    input s;
    output reg[63:0] data_out;
    integer i=0;
    /*assign data_out = (s) ? data2 : data1;*/
    always @(*) begin
        if(i==0)begin
            data_out=0;
        end
        else begin
            data_out = (s) ? data2 : data1;
        end
        i=i+1;
    end

endmodule