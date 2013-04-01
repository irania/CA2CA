module Mux (a,b,select,c);
  parameter n = 32;
  input [n-1:0] a;
  input [n-1:0] b;
  input select;
  output [n-1:0] c;  
  
  assign c = select?a:b;
  
endmodule
