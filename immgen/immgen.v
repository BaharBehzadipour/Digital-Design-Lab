`default_nettype none
module immgen (input1 ,output1);
 
input [63:0] input1;
output reg [63:0] output1;

always @(*)
begin
    if (input1[6:0]==7'b0000011) // i-type
    begin
        output1={{53{input1[31]}},input1[30:20]};
    end

    if (input1[6:0]==7'b0100011) //s-type
    begin  
        output1={{53{input1[31]}},input1[30:25],input1[11:7]};
    end

 if (input1[6:0]==7'b1100111) //sb-type
    begin 
        output1={{53{input1[31]}},input1[7],input1[30:25],input1[11:8]};
    end
 
end

   
endmodule
