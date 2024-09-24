module program_counter #(parameter pointer_width =32)(



input CLK,RST,LOAD,
input 	   [pointer_width-1:0] PC_NEXT,
output reg [pointer_width-1:0] PC



);


always @(posedge CLK or negedge RST) 
begin 
	if(!RST)
	begin
		PC <= 0;
	end
	else
	begin
		if(LOAD)
		begin
			PC <= PC_NEXT;
		end
		else
		begin
			PC <= PC;
		end
	end
end

	

endmodule
