module DATA_MEM #(parameter data_width=32,address_width = 32,depth=64)(
input        [address_width-1:0] A, //address
input        [data_width-1:0] WD,
input    		 clk,WE,rst,
output reg   [data_width-1:0] RD

);
integer i;
reg [data_width-1:0] Data_MEM [depth-1:0];
always @(posedge clk )
	begin
		if(!rst)
		begin
		for ( i=0; i < depth; i = i + 1)
		begin
			Data_MEM[i] <= 0;
		end
		end
		else
		begin
			if(WE)
			begin
		
				Data_MEM[A[31:2]]<=WD;
		
			end
		end
		
		
	
	
	end
	
	always @(*)
begin
  
   RD<=Data_MEM[A];
  
end
	
	
	
	
	
endmodule