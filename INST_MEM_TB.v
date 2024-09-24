`timescale 1ns/1ns //in is the precision



module TEST_INST_MEM();


reg	   [31:0] A_PC_TB;
wire      [31:0] INSTR_TB;






INST_MEM DUT(

.A_PC(A_PC_TB),
.INSTR(INSTR_TB)

);

initial
begin

	

A_PC_TB=0;

#40
A_PC_TB=8;

#20
$stop;
end
endmodule