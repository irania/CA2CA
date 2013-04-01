module SignExtender(a,s);
  input [15:0] a;
  output [31:0] s;
  wire [31:0]c = 32'hFFFF0000;
  assign s=a[15]?a+32'hFFFF0000:a;
endmodule
