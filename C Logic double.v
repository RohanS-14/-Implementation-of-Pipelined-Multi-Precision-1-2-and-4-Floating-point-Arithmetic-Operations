module Counter_Logic (E,In,E_Out,Man_Out);
  input [10:0]E;//7
  input [52:0]In;//22
  output [10:0]E_Out; 
  output [51:0]Man_Out;
  wire [52:0]M_Out;

  reg  [11:0]X;

  always @(E|In)
  begin
  if(In[52]==1'b1)
    X=11'd0;
  else if(In[51]==1'b1)
    X=11'd1;
  else if (In[50]=='b1)
    X=11'd2;
  else if (In[49]=='b1)
    X=11'd3;
  else if (In[48]=='b1)
    X=11'd4;
  else if (In[47]=='b1)
    X=11'd5;
  else if (In[46]=='b1)
    X=11'd6;
  else if (In[45]=='b1)
    X=11'd7;
  else if (In[44]=='b1)
    X=11'd8;
  else if (In[43]=='b1)
    X=11'd9;   
  else if (In[42]=='b1)       
      X=11'd10;       
  else if (In[41]=='b1)       
      X=11'd11;       
  else if (In[40]=='b1)       
      X=11'd12;       
  else if (In[39]=='b1)       
      X=11'd13;             
  else if (In[38]=='b1)       
      X=11'd14;             
  else if (In[37]=='b1)       
      X=11'd15;             
  else if (In[36]=='b1)       
      X=11'd16; 
  else if (In[35]=='b1)       
      X=11'd17;                   
  else if (In[34]=='b1)       
      X=11'd18;             
  else if (In[33]=='b1)       
      X=11'd19;             
  else if (In[32]=='b1)       
      X=11'd20;             
  else if (In[31]=='b1)       
      X=11'd21;             
  else if (In[30]=='b1)       
      X=11'd22;             
  else if (In[29]=='b1)       
      X=11'd23;             
  else if (In[28]=='b1)       
      X=11'd24;             
  else if (In[27]=='b1)       
      X=11'd25;             
  else if (In[26]=='b1)       
      X=11'd26;             
  else if (In[25]=='b1)       
      X=11'd27;             
  else if (In[24]=='b1)       
      X=11'd28;             
  else if (In[23]=='b1)       
      X=11'd29;  
  else if (In[22]=='b1)       
      X=11'd30;             
  else if (In[21]=='b1)       
      X=11'd31;             
  else if (In[20]=='b1)       
      X=11'd32;             
  else if (In[19]=='b1)       
      X=11'd33;             
  else if (In[18]=='b1)       
      X=11'd34;             
  else if (In[17]=='b1)       
      X=11'd35;             
  else if (In[16]=='b1)       
      X=11'd36;             
  else if (In[15]=='b1)       
      X=11'd37;             
  else if (In[14]=='b1)       
      X=11'd38;             
  else if (In[13]=='b1)       
      X=11'd39;  
  else if (In[12]=='b1)       
      X=11'd40;             
  else if (In[11]=='b1)       
      X=11'd41;             
  else if (In[10]=='b1)       
      X=11'd42;             
  else if (In[9]=='b1)       
      X=11'd43;             
  else if (In[8]=='b1)       
      X=11'd44;             
  else if (In[7]=='b1)       
      X=11'd45;             
  else if (In[6]=='b1)       
      X=11'd46;             
  else if (In[5]=='b1)       
      X=11'd47;             
  else if (In[4]=='b1)       
      X=11'd48;             
  else if (In[3]=='b1)       
      X=11'd49;  
  else if (In[2]=='b1)       
      X=11'd50;             
  else if (In[1]=='b1)       
      X=11'd51;             
  else if (In[0]=='b1)       
      X=11'd52;             
  end

assign M_Out=In<<X;  
assign E_Out=E-X;  
assign Man_Out=M_Out[51:0];

endmodule