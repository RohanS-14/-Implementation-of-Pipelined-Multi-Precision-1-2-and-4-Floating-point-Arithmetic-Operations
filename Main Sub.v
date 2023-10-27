module Floating_Point_Sub (A,B,S);
  input [31:0]A,B;
  output [31:0]S;
  wire [31:0]Bs;
  
  assign Bs={~B[31],B[30:0]};
  
  Floating_Point_Addition_New MM0 (A,Bs,S);
  
endmodule 