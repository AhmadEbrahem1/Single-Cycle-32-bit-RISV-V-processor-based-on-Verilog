`timescale 1ns/1ns //in is the precision

module test_PC ();
reg CLK_TB,RST_TB,LOAD_TB,PCSrc_TB;
reg [31:0]ImmExt_TB;
wire [31:0] PC_TB;







PC DUT (
.CLK(CLK_TB),
.RST(RST_TB),

.LOAD(LOAD_TB),

.PCSrc(PCSrc_TB),

.ImmExt(ImmExt_TB),

.PC(PC_TB)



);
always #5 CLK_TB=!CLK_TB;




initial
begin 
 $dumpfile("PC.vcd");
  $dumpvars;
CLK_TB=0;
RST_TB=0;
LOAD_TB=1;
PCSrc_TB=0;
ImmExt_TB=6;


#10
RST_TB=1;
#10
//4
PCSrc_TB=1; //10
#40
LOAD_TB=0;
#40



$finish;
 end


endmodule
