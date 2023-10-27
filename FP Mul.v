module FP_Multiplier_Single (A,B,Out);
	input [31:0] A;
	input [31:0] B;
	output reg[31:0] Out;


	reg [7:0] exp1,exp2;
	reg [22:0] man1,man2;
	wire [27:0] man_r;
	reg [31:0] answer;


   assign man_r=(({1'b1, man1[22:10]})*({1'b1, man2[22:10]}));

		
	always @ (*) 
	begin
	if (({A,B})==64'd0)
	Out=32'd0;
  else if (A==32'd0)
   Out=32'd0;
   else if (B==32'd0)
   Out=32'd0;
	else
	Out=answer;
	end
	always @ (*) 
	begin
		exp1 = A[30:23];
		exp2 = B[30:23];
		man1 = A[22:0];
		man2 = B[22:0];
		//exponent
		answer[30:23] = (man_r[27])? (({1'b0,exp1} + {1'b0,exp2}) - 9'd126) :  (({1'b0,exp1} + {1'b0,exp2}) - 9'd127); // remove the bias
		//mantissa
		answer[22:0] = (man_r[27])? man_r[26:4] : man_r[25:3] ;
		//sign
		answer[31] = A[31] ^ B[31];
	end
	
endmodule