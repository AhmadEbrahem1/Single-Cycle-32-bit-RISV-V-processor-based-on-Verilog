`timescale 1ns/1ns //in is the precision
module DataMEM_TB();

reg [5:0]   A_TB;
reg [31:0]  WD_TB;
reg         clk_TB,WE_TB;
wire [31:0] RD_TB;



DATA_MEM  DM_DUT(
.A(A_TB),
.WD(WD_TB),
.RD(RD_TB),
.WE(WE_TB),
.clk(clk_TB)


);

always #5 clk_TB=~clk_TB;
initial 
  begin 
    $dumpfile("DM.vcd");
    $dumpvars;
    clk_TB=0;
	   A_TB=0;
	   WE_TB=1;
	   WD_TB=15;
		#20
     if(RD_TB==15)
	     $display ("W is OK");
	 else 
		 $display ("value =%d",RD_TB);
	
	   WD_TB=60;
	   A_TB=30;
       #20
     if(RD_TB==60)
	    $display ("W is OK");
	  else 
	   	$display ("value =%d",RD_TB);
		
		
	  #20
      $finish;
  end
  

endmodule
