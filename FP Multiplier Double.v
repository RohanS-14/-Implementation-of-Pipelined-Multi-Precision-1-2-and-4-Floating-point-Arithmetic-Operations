module FP_Multiplier_Double (Clk,A,B,Out);
 input  Clk;
 input  [63:0] A;
 input  [63:0] B;
 output [63:0] Out;
 reg [51:0] m;
 reg [10:0] e;
 reg s;
 reg [105:0] product;
 reg SS;
 reg normalized;
 reg state; 
 reg next_state = 0;
 parameter STEP_1 = 1'b0, STEP_2 = 1'b1;
 always @(posedge Clk) 
  begin
		state <= next_state;
	end


	always @(state) 
	begin

		case(state)
			STEP_1: 
			begin
				product = {1'b1, A[51:0]} * {1'b1, B[51:0]};
				SS = |product[50:0]; 
				normalized = product[105];
				if(!normalized) product = product << 1; 
				next_state = STEP_2;			
			end	

			STEP_2: 
			begin
				if(!A[51:0] | !B[51:0]) 
				begin 
					s = 0; e = 0; m = 0;
				end 
				else 
				begin
					s = A[63] ^ B[63];
					m = product[104:53] + (product[52] & (product[51] | SS));
					e = A[62:52] + B[62:52] - 'd1023 + normalized;
				end 

				next_state = STEP_1;
				end
		endcase
	end
	assign Out = {s, e, m};
	
endmodule