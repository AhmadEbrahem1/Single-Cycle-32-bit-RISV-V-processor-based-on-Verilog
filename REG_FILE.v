
module REG_FILE #(parameter data_width=32,address_width = 5,depth=32)(
input	[address_width-1:0] A1,A2,A3,
input [data_width-1:0] WD3,
input              clk,RST,WE3,
output reg   [data_width-1:0] RD1,RD2	

);
reg [data_width-1:0] REG_MEM [depth-1:0];
integer i=0;
always @(posedge clk or negedge RST)
	begin
	if(!RST)
	begin 
	  // for loop or do this : 
	  for ( i=0; i < depth; i = i + 1)
	  begin
        REG_MEM[i] <= 0;
      end
	
	end
	else
	 if(WE3)
		begin
		
		REG_MEM[A3]<=WD3;
		
		end
		else
		begin
			REG_MEM[A3]<=REG_MEM[A3]; ///////// not needed
		end
	end
	
	
	always @(*)
begin
  if(!RST)
   begin
     RD1=0;
     RD2=0;
   end
else
  begin 
   RD1=REG_MEM[A1];
   RD2=REG_MEM[A2];
  end
end

endmodule