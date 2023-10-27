module Final_Kit (Clk,Rst,Sel_In,Sel_Out,result);
  input     Clk;
  input     Rst;
  input [2:0]Sel_In;
  input [1:0]Sel_Out;
  output    [15:0] result;
  
  reg [31:0]Out;
  
  wire     [31:0] input_a;
  wire  [31:0] input_b;
  wire [63:0] input_da;
  wire [63:0] input_db;
  
  wire [31:0]Add,Sub,Mul,Div;
  
  wire [63:0] dadd,dsub,dmul,ddiv;
  
  assign input_a=32'b01000010001101100001010001111011;
  assign input_b=32'b01000001110010100000000000000000;
  assign input_da= 64'b0100000001100000101111000011000100100110111010010111100011010101; //133.881
  assign input_db= 64'b0100000001101010011111111110111110011101101100100010110100001110; //211.998
  
  FP_Addition M1 (input_a,input_b,Add);
  Floating_Point_Sub M2(input_a,input_b,Sub);
  FP_Multiplier_Single M3 (input_a,input_b,Mul);
  FloatingDivision M4 (Clk,Rst,input_a,input_b,Div);
  FP_Multiplier_Double M5(Clk,input_da,input_db,dmul);
  Floating_Point_Addition_Double  M6(input_da,input_db,dadd);
  Floating_Point_Sub_Double M7(input_da,input_db,dsub);
  double_divider M8 (Clk,Rst,input_da,input_db,ddiv);
  
 
    always @(*) 
	begin
    case(Sel_In)
    3'b000: Out = Add;
	  3'b001: Out = Sub;
	  3'b010: Out = Mul;
	  3'b011: Out = Div;
	  3'b100: Out = dadd;
	  3'b101: Out = dsub;
	  3'b110: Out = dmul;
	  3'b111: Out = ddiv
    endcase
  end
  
  //assign result=Sel_Out?Out[31:16]:Out[15:0];  
  
  assign result=Sel_Out?Out[31:16]:Out[15:0];
  always @(*)
  begin
  case(Sel_Out)
  3'b00: result=Out[15:0];
  3'b01: result=Out[31:16];
  3'b10: result = Out[47:32];
  3'b11: result = Out[63:48];  

endmodule