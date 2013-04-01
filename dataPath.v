module DataPath (clk , reset , RegDest , RegWr ,ALUop ,ALUSrc ,MemRead,MemWrite,MemtoReg ,PCSrc);
  input clk , reset, RegDest , RegWr ,ALUop ,ALUSrc ,MemRead,MemWrite,MemtoReg ,PCSrc;
  reg [31:0] stsReg;
  reg [31:0] pc;
  wire [31:0] inst, wrData , reData1 , reData2 ,op2 ,aluResult ,memdata ,signout ,op2adder2,op1adder2,resultAdder2;//wrData,carry,op,z,n,v,c
  wire [3:0] wrReg , aluctrl ;
 
  InstMemory instmem(reset , pc , inst);
  Mux writeadr(4'b1110,inst[15:12],RegDest,wrReg);
  RegisterFile regBank (RegWr,reset,clk,inst[19:16],inst[3:0],wrReg,wrData,reData1,reData2);
  ALUController aluctr(inst[24:21],ALUop,aluctrl);
  Mux aluop2(32'h000000FF&inst[7:0],reData2,ALUSrc,op2);
  ALU alu(reData1,op2,carry,aluctrl,Z,N,V,C,aluResult);
  DataMemory datamem(clk,reset,aluResult,reData2,MemRead,MemWrite,memdata);
  Mux memtoreg(memdata,aluResult,MemtoReg,wrData);
  SignExtender sgnext(inst[23:0],signout);//:D
  Shifter shift(signout,op2adder2);
  Adder adder1(pc,4,op1adder2);
  Adder adder2(op1adder2,op2adder2,resultAdder2);
  Mux muxpc(resultAdder2,op1adder2,PCSrc,pc);

endmodule
