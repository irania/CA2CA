module RegisterFile (regWr,reset,clk,reReg1,reReg2,wrReg,wrData,reData1,reData2);
  input regWr;
  input clk,reset;
  input [4:0]reReg1;
  input [4:0]reReg2;
  input [4:0]wrReg;
  input [31:0]wrData;
  output reg [31:0]reData1;
  output reg [31:0]reData2;
  
  reg [31:0]registers[0:16];
  
 always @(posedge clk)begin
   if(reset)
   registers[0] <= 3'b0;
   else begin 
    reData2 = registers[reReg2];
    reData1 = registers[reReg1];
    if(regWr)
      registers[wrReg] = wrData;
   end
  end
   
endmodule
