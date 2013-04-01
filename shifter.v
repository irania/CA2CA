module Shifter (a,s);
  input [31:0] a;
  output [31:0] s;
  assign s = a>>2;
endmodule
