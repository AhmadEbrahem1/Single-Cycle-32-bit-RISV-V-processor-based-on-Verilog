
`timescale 1us/1ns //in is the precision
module ALU32_TB();
  

 reg [31:0] A_TB,B_TB;
 reg [2:0] ALU_Fun_TB;
 reg clk_TB;
 wire [31:0] ALU_output_TB,FF_ALU_output_TB;
 wire  Zero_Flag_Tb,Sign_Flag_Tb;

ALU_32 DUT1
(.A(A_TB),
.B(B_TB),
.ALU_Control(ALU_Fun_TB),
.clk(clk_TB),
.ALU_result(ALU_output_TB),
.FF_ALU_result(FF_ALU_output_TB),
.Zero_Flag(Zero_Flag_Tb),
.Sign_Flag(Sign_Flag_Tb)
);
//clk
always #5 clk_TB=~clk_TB;

initial 
  begin 
    $dumpfile("ALU_32.vcd");
    $dumpvars;
    clk_TB=0;
    A_TB=10;
    B_TB=5;
    // +
    ALU_Fun_TB=0;
    #10 if(ALU_output_TB==15)
          $display ("addition is OK");
        else
          $display ("addition is not OK");
    ALU_Fun_TB=1;
    #10 if(ALU_output_TB==320)
          $display ("SHL is OK");
          else
           $display ("SHL is not OK");
     
    ALU_Fun_TB=2;
    #10 if(ALU_output_TB==5)
          $display ("sub is OK");
          else
          $display (" sub is not OK"); 
   
    ALU_Fun_TB=4;
    #10 if(ALU_output_TB==15)
          $display ("Xoring is OK");
          else
          $display (" Xoring is not OK"); 
    ALU_Fun_TB=5;
    #10 if(ALU_output_TB==0)
          $display ("SHR is OK");
          else
          $display (" SHR is not OK"); 
    ALU_Fun_TB=6;
    #10 if(ALU_output_TB==15)
          $display ("oring is OK");
          else
          $display (" oring is not OK"); 
    ALU_Fun_TB=7;
    #10 if(ALU_output_TB==0 && Zero_Flag_Tb==1) 
          $display ("AND is OK");
          else
          $display (" AND is not OK"); 
    
          
          
          
    ALU_Fun_TB=3'b011; //expected =0
    #10 if(ALU_output_TB==0 && Zero_Flag_Tb==1 )
          $display ("default case is OK");
          else
          $display ("default case is not OK");
    #50
    $finish;
  end


endmodule



