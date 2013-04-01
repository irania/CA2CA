module InstMemory(reset , adr , inst);
  input reset;
  input [31:0] adr;
  output reg [31:0] inst;
  reg [7:0] instmem [0:4096];
  
  always@(*)begin
  if(reset)
    $readmemb ("inst_mem.dat",instmem);
  else
    inst={instmem[adr],instmem[adr+1],instmem[adr+2],instmem[adr+3]};
  end
endmodule