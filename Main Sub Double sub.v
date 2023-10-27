module Floating_Point_Sub_Double (A,B,S);
  input [63:0]A,B;
  output [63:0]S;
  
  
  wire [63:0]Bs;
  
  assign Bs={~B[63],B[62:0]};
   
  Floating_Point_Addition_Double MM0 (A,Bs,S);
  
endmodule



// 5.5 ---- 010101010101
//-
//3.5 ----- 01010101010101


/// ------- 11010101010101
   
   
   