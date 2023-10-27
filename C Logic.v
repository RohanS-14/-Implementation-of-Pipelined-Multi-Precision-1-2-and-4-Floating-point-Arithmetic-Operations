module Counter_Logic (E,In,E_Out,Man_Out);
  input [7:0]E;
  input [23:0]In;
  output [7:0]E_Out;
  output [22:0]Man_Out;
  wire [23:0]M_Out;

  reg  [7:0]X;

  always @(E|In)
  begin

  if(In[23]==1'b1)
    X=8'd0;
  else if(In[22]==1'b1)
    X=8'd1;
  else if (In[21]=='b1) 
    X=8'd2;
  else if (In[20]=='b1)
    X=8'd3;
  else if (In[19]=='b1)
    X=8'd4;
  else if (In[18]=='b1)
    X=8'd5;
  else if (In[17]=='b1)
    X=8'd6;
  else if (In[16]=='b1)
    X=8'd7;
  else if (In[15]=='b1)
    X=8'd8;
  else if (In[14]=='b1)
    X=8'd9;   
  else if (In[13]=='b1)       
      X=8'd10;       
  else if (In[12]=='b1)       
      X=8'd11;       
  else if (In[11]=='b1)       
      X=8'd12;       
  else if (In[10]=='b1)       
      X=8'd13;             
  else if (In[9]=='b1)       
      X=8'd14;             
  else if (In[8]=='b1)       
      X=8'd15;             
  else if (In[7]=='b1)       
      X=8'd16; 
  else if (In[6]=='b1)       
      X=8'd17;                   
  else if (In[5]=='b1)       
      X=8'd18;             
  else if (In[4]=='b1)       
      X=8'd19;             
  else if (In[3]=='b1)       
      X=8'd20;             
  else if (In[2]=='b1)       
      X=8'd21;             
  else if (In[1]=='b1)       
      X=8'd22;             
  else if (In[0]=='b1)       
      X=8'd23;             

  end

assign M_Out=In<<X;  
assign E_Out=E-X;  
assign Man_Out=M_Out[22:0];

endmodule
