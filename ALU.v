module ALU (a,b,carry,op,Z,N,V,C,s);
  input [31:0]a ,b;
  input carry;
  input [3:0] op;
  output reg Z,N,V,C;
  output reg [31:0] s;
  
  always @(a,b,op)begin
    case (op)
      4'b0000: s=a&b;
      4'b0001: s=a^b;
      4'b0010: s=a-b; 
      4'b0011: s=b-a;
      4'b0100: s=a+b;
      4'b0101: s=a+b+carry;
      4'b0110: s=a-b+carry-1;
      4'b0111: s=b-a+carry-1;
      4'b1000: C=a&&b;
      4'b1001: C=a^^b;
      4'b1010: C=a-b?1:0;
      4'b1011: C=a+b?1:0;
      4'b1100: s=a|b;
      4'b1101: s=b;
      4'b1110: s=a&~b;
      4'b1111: s=~b;
    endcase
    
  end
endmodule