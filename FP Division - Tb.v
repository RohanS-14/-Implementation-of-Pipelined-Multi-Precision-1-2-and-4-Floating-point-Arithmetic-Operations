module FloatingDivision_Tb ();
  reg     Clk;
  reg     Rst;
  reg    [31:0] input_a,input_b;
  wire    [31:0] result;
  
  
    
  initial 
  begin
    Clk = 1;
	Rst = 1;
	input_a=32'b01000011100000000010000101001000;
	input_b=32'b01000001110010100000000000000000;
	

    #100 
    Rst = 0;
	
	#15000
    
    
$stop;

end
   
   always 
   #50  Clk =  ! Clk; 
  
  FloatingDivision M0 (Clk,Rst,input_a,input_b,result);
  

  
  
endmodule