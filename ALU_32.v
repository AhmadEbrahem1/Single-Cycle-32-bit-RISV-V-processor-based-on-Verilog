module ALU_32 #(parameter Width_ALU_FUN=3,
 parameter Width_ALU_Out=32)
(input [Width_ALU_Out-1:0] A,B,
input [Width_ALU_FUN-1:0] ALU_Control,
input  clk,
output reg [Width_ALU_Out-1:0] ALU_result,
output reg Zero_Flag,Sign_Flag

);
 
 always @(*)
  begin
    Zero_Flag= (ALU_result==0);
    Sign_Flag= ALU_result[31];
  end
always @(*)
  begin
    // flags initialization
  		ALU_result = 0;
		//Zero_Flag =0;
		//Sign_Flag =0; simulation race [Write write  race]
    case(ALU_Control)
		'b000 : 
		begin
			ALU_result= A+B;
			
		end 
		'b001 :
		begin
			ALU_result= (A<<B);
			
			
		end   
		'b010:
		begin
			ALU_result= A-B;
			
			
		end
		
		'b100:
		begin
			ALU_result= A ^ B;
			
			
		end
		'b101:
		begin
			ALU_result = (A >> B);
		
			
		end
		'b110:
		begin
			ALU_result= (A | B);
			
			
		end
		'b111:
		begin
			ALU_result = A & B;
			
			
		end
		default:
		begin
			ALU_result = 0;
		end
		
	 
    endcase     
  end
  
  



endmodule





