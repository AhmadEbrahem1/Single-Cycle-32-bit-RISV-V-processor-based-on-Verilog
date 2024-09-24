module TOP_RISC #(parameter data_width = 32)(
input rst,clk,
output  wire [data_width-1:0] result_final

);

wire PCSrc,ALUSrc,Zero,sign_flag,ResultSrc,MemWrite;
wire [data_width-1:0] PC,Instruction,result,ALU_result,ReadData;
wire [data_width-1:0] PCPlus4,PCTarget,PCNext;
wire RegWrite;
wire [data_width-1:0] SrcA,WriteData,ImmExt,SrcB;
wire [2:0]	ALUControl;
wire [1:0] ImmSrc;
MUX inst1_MUX (
.IN1(PCPlus4),
.IN2(PCTarget),
.SEL(PCSrc),
.out(PCNext)
);

program_counter inst_program_counter (

.CLK(clk),
.RST(rst),
.LOAD(1'b1),
.PC_NEXT(PCNext),
.PC(PC)
);

INST_MEM inst_INST_MEM (

.A_PC(PC),
.INSTR(Instruction)

);

REG_FILE inst_REG_FILE (
.A1(Instruction[19:15]),
.A2(Instruction[24:20]),
.A3(Instruction[11:7]),
.WD3(result),
.clk(clk),
.RST(rst),
.WE3(RegWrite),
.RD1(SrcA),
.RD2(WriteData)
);
MUX inst2_MUX (
.IN1(WriteData),
.IN2(ImmExt),
.SEL(ALUSrc),
.out(SrcB)
);

 ALU_32 inst_ALU_32 
( 
.A(SrcA),
.B(SrcB),
.ALU_Control(ALUControl),
.clk(clk),
.ALU_result(ALU_result),
.Zero_Flag(Zero),
.Sign_Flag(sign_flag)

);
 
 DATA_MEM  inst_DATA_MEM(
.A(ALU_result), 
.WD(WriteData),
.clk(clk),
.WE(MemWrite),
.rst(rst),
.RD(ReadData) 
 );
 
 
 
 MUX inst3_MUX (
.IN1(ALU_result),
.IN2(ReadData),
.SEL(ResultSrc),
.out(result)
 
 );
 
 SIGN_EXTEND inst_SIGN_EXTEND (
.INST(Instruction), //7:31
.ImmSrc(ImmSrc),
.ImmExt(ImmExt)
 
 );
 
 
 
 
assign PCPlus4 = PC + 32'd4 ;
assign PCTarget = PC + ImmExt ;



CTRL_UNIT inst_CTRL_UNIT (
.OPCODE(Instruction[6:0]),
.funct3(Instruction[14:12]),
.funct7(Instruction[30]),
.Zero(Zero),
.sign_flag(sign_flag),

.ALUControl(ALUControl),
.ImmSrc(ImmSrc),
.PCSrc(PCSrc),
.ResultSrc(ResultSrc),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite)





);
assign result_final = result;



endmodule