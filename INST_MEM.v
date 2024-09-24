
module INST_MEM  #(parameter pc_width=32,reg_width=32,depth=64)(

input 	   [pc_width-1:0] A_PC,
output reg [reg_width-1:0] INSTR

);

reg [reg_width-1:0] MEM [depth-1:0];
reg  [pc_width-1:0] A;

initial
begin
	MEM[0]=32'h00004033     ;
	MEM[1]=32'h00000093     ;
	MEM[2]=32'h00100113     ;
	MEM[3]=32'h00100193     ;
	MEM[4]=32'h00100213     ;
	MEM[5]=32'h00000293     ;
	MEM[6]=32'h00a00313     ;
	MEM[7]=32'h00000393     ;
	MEM[8]=32'h00418c63     ;
	MEM[9]=32'h00110133     ;
	MEM[10]=32'h404181b3    ;
	MEM[11]=32'h00229393    ;
	MEM[12]=32'h0023a023    ;
	MEM[13]=32'h00420a63    ;
	MEM[14]=32'h002080b3    ;
	MEM[15]=32'h004181b3    ;
	MEM[16]=32'h00229393    ;
	MEM[17]=32'h0013a023    ;
	MEM[18]=32'h00128293    ;
	MEM[19]=32'hfc62cae3    ;
	MEM[20]=32'h00000000    ;
	/*
	for ()
	begin
		$readmemh("INST_MEM.txt",)
	end
	*/
end









always @(*)
begin 
	
	INSTR=MEM[A_PC[31:2]];


end



endmodule