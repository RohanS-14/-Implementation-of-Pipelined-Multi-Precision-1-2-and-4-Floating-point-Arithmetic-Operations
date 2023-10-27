module Floating_Point_Addition_Double (A,B,S);
  input [63:0]A,B;
  output [63:0]S;
  wire Sign_A; 
  wire Sign_B;
  wire [51:0]Mantissa_A,Mantissa_B;
  wire [10:0]Exponent_A,Exponent_B;
  reg [10:0]N_E;
  reg [51:0]N_M;
  wire [63:0]C;

  wire [10:0]E,N_Ek,N_Es;
  wire [10:0]E_Diff;
  wire [51:0]M1,M2,Man_Sub,Man_Sub_Big;
  wire [51:0]N_Mant;
  wire [54:0]M1_Adjus,M2_Adjus,N_Mants,New_Man_Sub,New_Man_Adjus;
  wire [51:0]N_Ms,N_Mk;
  wire [53:0]Main_M,N_Main1;
  wire [52:0]N_Main11,New_Main_Sub,New_Mants;
  wire [10:0]Ej,Ejk;
  wire [51:0]Mj,Mjk;
  
  
  assign Sign_A=A[63];
  assign Sign_B=B[63];
  assign Exponent_A=A[62:52];
  assign Exponent_B=B[62:52];
  assign Mantissa_A=A[51:0];
  assign Mantissa_B=B[51:0];
  
  assign E=(A[62:0]>=B[62:0])?Exponent_A:Exponent_B;
  assign E_Diff=(A[62:0]>=B[62:0])?(Exponent_A-Exponent_B):(Exponent_B-Exponent_A);  
  
  Counter_Logic CC (
   .E(E),
   .In(N_Main11),
   .E_Out(Ej),
   .Man_Out(Mj)
   );      

   assign N_Main1=N_Mants+M1_Adjus;
   assign N_Ms=N_Main1[53]?N_Main1[52:1]:N_Main1[51:0];            
   assign N_Es=E+N_Main1[53];      
   
   
   assign N_Main11=(N_Mants>M1_Adjus)?N_Mants-M1_Adjus:M1_Adjus-N_Mants;
   
 //******************************************************************************//
   
   assign Man_Sub=(A[62:0]>B[62:0])?Mantissa_B:Mantissa_A;
   assign Man_Sub_Big=(A[62:0]<B[62:0])?Mantissa_B:Mantissa_A;
   assign New_Mants={1'b1,Man_Sub[51:0]};
   
   assign New_Man_Sub=New_Mants>>(E_Diff);
   assign New_Man_Adjus={1'b1,Man_Sub_Big[51:0]};   
   assign New_Main_Sub=New_Man_Adjus-New_Man_Sub;   
   
   
  Counter_Logic CC1 (
   .E(E),
   .In(New_Main_Sub),
   .E_Out(Ejk),
   .Man_Out(Mjk)
   );      
   
   


  
//*************************************************************************//

  assign M1=(A[62:0]>B[62:0])?Mantissa_A:Mantissa_B;
  assign M2=(A[62:0]<B[62:0])?Mantissa_A:Mantissa_B;
  
  assign N_Mants={1'b1,M2[51:0]};
  assign N_Mant={1'b1,M2[51:1]};
  assign M2_Adjus=N_Mant>>(E_Diff-1);
  assign M1_Adjus={1'b1,M1[51:0]};
  assign Main_M=M1_Adjus+M2_Adjus;
  assign Sign=(A[62:0]>B[62:0])?Sign_A:Sign_B;  
  assign N_Ek=E+Main_M[53];
  assign N_Mk=Main_M[53]?Main_M[52:1]:Main_M[51:0];
  assign C=A|B;
  assign S=(C==64'd0)?64'd0:{Sign,N_E,N_M};
  


  
  


always @ (*)
begin
if(Sign_A==Sign_B) // Eqaul Signs 
 begin //2
     if (E_Diff==11'd0) //EDiff==0
     begin //3 
     if (Mantissa_A==Mantissa_B)//Matisssas Equals
      begin //4
      N_E=(E+11'd1);
      N_M=Mantissa_A;
      end//4
      else
      begin /// Mantissa Not Equal //5
      N_E=N_Es;
      N_M=N_Ms;
      end//5
  end//3
 else // Ediff Not Zero//2
   begin //6
   N_E=N_Ek;
   N_M=N_Mk;   
   end//6
   end//2
 else // Sign Not Equal
 begin //1
     if (E_Diff==11'd0)//EDiff is Zero 
      begin //2 
	  if (Mantissa_A==Mantissa_B)// Matissas Equal 
	    begin //3
		    N_E=11'd0;
			N_M=52'd0;
		end//3
      else //Mantissas Not Equal 
	     begin //4
		 N_E=Ej;
		 N_M=Mj;
		 end//4
     end//2
    else // Ediff is Not Zero 
      begin //5
      N_E=Ejk;
      N_M=Mjk;
      end//5
end//1
end

endmodule