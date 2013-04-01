module DataMemory (clk,reset,adr,writedata,memread,memwrite,data);
  input clk,reset;
  input[31:0] adr,writedata;
  input memread,memwrite;
  output [31:0] data;
  reg [7:0] datamem [0:4096*8];
  
  always@(posedge clk)begin
    if(reset)
      $readmemb("data_mem.dat",datamem);
    else
      if(memwrite)
        {datamem[adr],datamem[adr+1],datamem[adr+2],datamem[adr+3]}<=writedata;
  end
   assign data = memread?{datamem[adr],datamem[adr+1],datamem[adr+2],datamem[adr+3]}:data;
endmodule
