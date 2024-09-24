`timescale 1ns/1ns //in is the precision
module Reg_File_TB();

reg [4:0]   A1_TB,A2_TB,A3_TB;
reg [31:0]  WD3_TB;
reg         clk_TB,RST_TB,WE3_TB;
wire [31:0] RD1_TB,RD2_TB;



REG_FILE  RF_DUT(
.A1(A1_TB),
.A2(A2_TB),
.A3(A3_TB),
.WD3(WD3_TB),
.clk(clk_TB),
.RST(RST_TB),
.WE3(WE3_TB),
.RD1(RD1_TB),
.RD2(RD2_TB)



);

always #5 clk_TB=~clk_TB;
initial 
  begin 
    $dumpfile("RF.vcd");
    $dumpvars;
    clk_TB=0;
	A1_TB=0;A2_TB=0;A3_TB=0;
	WD3_TB=15;
	RST_TB=1;
	WE3_TB=1;
  
  #20
  if(RD1_TB==15)
	$display ("W is OK");
	else 
		$display ("value =%d",RD1_TB);
	
	WD3_TB=60;
  #20
   if(RD1_TB==60)
	$display ("W is OK");
	else 
		$display ("value =%d",RD1_TB);
		
		
		#20
  $finish;
  end
  

endmodule