module SIGN_EXTEND #(parameter input_width =32 , output_width = 32,Immsrc_width =2)(

input [input_width-1:0] INST, //7:31
input [Immsrc_width-1:0]ImmSrc,
output reg [output_width-1:0] ImmExt
);




//*///////// load and store word



//main decoder
always @(*)
begin 
	case(ImmSrc)
	'b00: 
	begin
		ImmExt={{20{INST[input_width-1]}},INST[31:20]};
	end
	'b01: 
	begin
		ImmExt={{20{INST[input_width-1]}},INST[31:25],INST[11:7]};
	end
	'b10: 
	begin
		ImmExt={{20{INST[input_width-1]}},INST[7],INST[30:25],INST[11:8],1'b0};
	end
	default: 
	begin
		ImmExt={{12{INST[input_width-1]}},INST[19:12],INST[20],INST[30:21],1'b0};
	end
	
	endcase 
 
end 



endmodule