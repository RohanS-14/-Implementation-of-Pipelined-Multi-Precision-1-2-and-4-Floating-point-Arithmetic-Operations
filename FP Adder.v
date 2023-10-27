module Floating_Point_Addition_New (A,B,S);
  input [31:0]A,B;
  output [31:0]S;
  
  FP_Addition MM0 (.a_original(A),.b_original(B),.sum(S));  

endmodule
