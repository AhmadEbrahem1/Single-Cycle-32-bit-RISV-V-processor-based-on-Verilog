module CTRL_UNIT(

input [6:0] OPCODE,
input [2:0]funct3,
input    funct7,Zero,sign_flag,


output wire [2:0] ALUControl,
output wire [1:0]ImmSrc,
output wire PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite

);


wire [1:0] alu_op;
//ALU Decoder
alu_decoder inst_alu_decoder (


.funct3(funct3),
.funct7(funct7),
.alu_op(alu_op),
.ALUControl(ALUControl),
.OPCODE(OPCODE[5])
);

main_decoder inst_main_decoder(
.OPCODE(OPCODE),
.funct3(funct3),
.ImmSrc(ImmSrc),
.PCSrc(PCSrc),
.ResultSrc(ResultSrc),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite),
.ALUOP(alu_op),
.sign_flag(sign_flag),
.Zero(Zero)

);




endmodule

module alu_decoder (
input  OPCODE,
input [2:0]		funct3,
input    		funct7,
input [1:0]	 	alu_op,


output  reg [2:0]  	ALUControl

);


always @(*)
begin
	
	case(alu_op)
	'b00:
	begin
		ALUControl='b000;
		
	end
	'b01:
	begin
		ALUControl='b010;
	end
	'b10:
	begin
		case(funct3)
		'b000:
		begin
			if(OPCODE==1 && funct7==1)
			begin
				ALUControl='b010;
			end
			else
			begin
				ALUControl='b000;
			end
		end
		'b001:
		begin
			ALUControl='b001;
		end
		'b100:
		begin
			ALUControl='b100;
		end
		'b101:
		begin
			ALUControl='b101;
		end
		'b110:
		begin
			ALUControl='b110;
		end
		'b111:
		begin
			ALUControl='b111;
		end
		default:
		begin
			ALUControl='b000;
		end
		
		endcase
	end
	
	default:
	begin
		ALUControl='b000;
	end
	endcase
	
	
end




endmodule

module main_decoder (
input [6:0] OPCODE,
input [2:0]		funct3,
input sign_flag,Zero,
output reg [1:0]ImmSrc,ALUOP,
output reg PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite


);

reg branch;

wire beq,bnq,blt;

assign beq =Zero & branch;
assign bnq =(!Zero) & branch;
assign blt =sign_flag & branch;





//main decoder
always @(*)
begin 
 case(OPCODE)
   'b000_0011: 
   begin
    RegWrite=1;
	ImmSrc='b00;
	ALUSrc=1;
	MemWrite=0;
	ResultSrc=1;
	branch=0;
	ALUOP='b00;
   end
   'b010_0011:
   begin 
    RegWrite=0;
	ImmSrc='b01;
	ALUSrc=1;
	MemWrite=1;
	ResultSrc=0;
	branch=0;
	ALUOP='b00;
   
   end
   'b011_0011:
   begin 
    RegWrite=1;
	ImmSrc='b01; //xx 
	ALUSrc=0;
	MemWrite=0;
	ResultSrc=0;
	branch=0;
	ALUOP='b10;
   
   
   end
   'b001_0011:
   begin
    RegWrite=1;
	ImmSrc='b00;
	ALUSrc=1;
	MemWrite=0;
	ResultSrc=0;
	branch=0;
	ALUOP='b10;


   end
   'b110_0011:
   begin
	RegWrite=0;
	ImmSrc='b10;
	ALUSrc=0;
	MemWrite=0;
	ResultSrc=0;
	branch=1;
	ALUOP='b01;
	



   end
   default
   begin 
	RegWrite=0;
	ImmSrc='b00;
	ALUSrc=0;
	MemWrite=0;
	ResultSrc=0;
	branch=0;
	ALUOP='b00;
   
   
   end
	
	
 
 

 endcase


case (funct3)
'b000:
begin
	PCSrc = beq;
end
'b001:
begin
	PCSrc = bnq;
end
'b100:
begin
	PCSrc = blt;
end
default:
begin
	PCSrc = blt; //
end
endcase

end


endmodule

