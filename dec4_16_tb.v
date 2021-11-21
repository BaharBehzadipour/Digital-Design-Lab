`timescale 1ps/1ps
`include "dec4_16.v"

module dec4_16_tb;

reg [3:0] W;
reg Enable;
wire [0:15] Y;

dec4_16 uut (W , Enable , Y)

initial begin
  
  $dumpfile("dec4_16_tb.vcd")
  $dumpvars(0,dec4_16_tb)


  En=1;
  w[0]=0
  w[1]=0
  w[2]=0
  w[3]=0

  if(Y[0]!=1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0000");
  #20

  En=1;
  En=1;
  w[0]=1
  w[1]=0
  w[2]=0
  w[3]=0

  if(Y[0]==1 || Y[1]!=1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0001");

  #20

  En=1;
  En=1;
  w[0]=0
  w[1]=1
  w[2]=0
  w[3]=0

  if(Y[0]==1 || Y[1]==1 || Y[2]!=1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0010");
  #20

  En=1;
  w[0]=1
  w[1]=1
  w[2]=0
  w[3]=0

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]!=1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0011");
  #20

  En=1;
  w[0]=0
  w[1]=0
  w[2]=1
  w[3]=0

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]!=1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0100");
  #20


  En=1;
  w[0]=1
  w[1]=0
  w[2]=1
  w[3]=0

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]!=1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0101");
  #20


  En=1;
  w[0]=0
  w[1]=1
  w[2]=1
  w[3]=0

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]!=1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0110");
  #20


  En=1;
  w[0]=1
  w[1]=1
  w[2]=1
  w[3]=0

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]!=1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 0111");
  #20


  En=1;
  w[0]=0
  w[1]=0
  w[2]=0
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]!=1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 1000");
  #20


  En=1;
  w[0]=1
  w[1]=0
  w[2]=0
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]!=1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 1001");
  #20


  En=1;
  w[0]=0
  w[1]=1
  w[2]=0
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]!=1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 1010");
  #20


  En=1;
  w[0]=1
  w[1]=1
  w[2]=0
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]!=1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 1011");
  #20

  En=1;
  w[0]=0
  w[1]=0
  w[2]=1
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]!=1 ||Y[13]==1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 1100");
  #20


  En=1;
  w[0]=1
  w[1]=0
  w[2]=1
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]!=1 ||Y[14]==1 ||Y[15]==1)
    $display("test faile for 1101");
  #20



  En=1;
  w[0]=0
  w[1]=1
  w[2]=1
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]!=1 ||Y[15]==1)
    $display("test faile for 1110");
  #20

  En=1;
  w[0]=1
  w[1]=1
  w[2]=1
  w[3]=1

  if(Y[0]==1 || Y[1]==1 || Y[2]==1 ||Y[3]==1 ||Y[4]==1 ||Y[5]==1 ||Y[6]==1 ||Y[7]==1 ||Y[8]==1 ||
  Y[9]==1 ||Y[10]==1 ||Y[11]==1 ||Y[12]==1 ||Y[13]==1 ||Y[14]==1 ||Y[15]!=1)
    $display("test faile for 1111");
  #20

  $display("test complete");
end

endmodule
