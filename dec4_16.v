//decoder 2 to 4 

module dec2_4 (W  , Y, Enable);

    input [1:0] W;
    input Enable;

    output reg [0:3] Y;

    always @(W, Enable)

        case ({Enable, W})

            3'b100: Y = 4'b1000;
            3'b101: Y = 4'b0100;
            3'b110: Y = 4'b0010;
            3'b111: Y = 4'b0001;
            default: Y = 4'b0000;

        endcase

endmodule


//decoder 4 to 16 

module dec4_16 (W  , Y, Enable);

    input [3:0] W;
    input Enable;

    output [0:15] Y;

    wire [0:3] T;

    dec2_4 Dec1 (W[3:2],T[0:3], Enable);
    dec2_4 Dec2 (W[1:0], Y[0:3], T[0]);
    dec2_4 Dec3 (W[1:0], Y[4:7], T[1]);
    dec2_4 Dec4 (W[1:0], Y[8:11], T[2]);
    dec2_4 Dec5 (W[1:0], Y[12:15], T[3]);

endmodule
