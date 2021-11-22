module mux2_64bit(w0, w1, s, f);
    input [63:0]w0, [63:0]w1, s;
    output reg [63:0]f;

    always @(w0, w1, s)
    begin

    if (s == 0)
        f = w0;
    else
        f = w1;
    end
endmodule
