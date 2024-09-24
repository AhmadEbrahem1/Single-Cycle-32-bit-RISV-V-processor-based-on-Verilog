module TEST_CTRL_UNIT();

reg [6:0] OPCODE_TB;
reg [2:0]funct3_TB;
reg    funct7_TB,Zero_TB,sign_flag_TB;
wire [2:0] ALUControl_TB;
wire [1:0]ImmSrc_TB;
wire PCSrc_TB,ResultSrc_TB,MemWrite_TB,ALUSrc_TB,RegWrite_TB;

CTRL_UNIT DUT (


 .OPCODE(OPCODE_TB),
.funct3(funct3_TB),
.funct7(funct7_TB),
.Zero(Zero_TB),
.sign_flag(sign_flag_TB),
.ALUControl(ALUControl_TB),
.ImmSrc(ImmSrc_TB),
.PCSrc(PCSrc_TB),
.ResultSrc(ResultSrc_TB),
.MemWrite(MemWrite_TB),
.ALUSrc(ALUSrc_TB),
.RegWrite(RegWrite_TB)



);
initial 
begin
$dumpfile("CTRL.vcd");
$dumpvars;
OPCODE_TB=0;
funct3_TB=0;
funct7_TB=0;
Zero_TB=0;
sign_flag_TB=0;
#10
OPCODE_TB='b00000011;
funct3_TB=0;
funct7_TB=0;
Zero_TB=0;
sign_flag_TB=0;
#10
OPCODE_TB='b1100011;
funct3_TB=100;
funct7_TB=0;
Zero_TB=0;
sign_flag_TB=0;
#10
OPCODE_TB='b1100011;
funct3_TB=100;
funct7_TB=0;
Zero_TB=0;
sign_flag_TB=1;
#10
OPCODE_TB='b0110011;
funct3_TB=111;
funct7_TB=0;
Zero_TB=0;
sign_flag_TB=0;
#10
OPCODE_TB='b0110011;
funct3_TB=000;
funct7_TB=1;
Zero_TB=0;
sign_flag_TB=0;
#20
$stop;
end


endmodule