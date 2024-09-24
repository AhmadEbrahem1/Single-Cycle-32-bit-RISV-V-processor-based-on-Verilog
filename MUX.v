module MUX #(parameter in_width = 32,sel_width = 1)(

input 		[in_width-1:0] 		IN1,IN2,
input 		[sel_width-1:0]		SEL,
output reg  [in_width-1:0]		out



);








always @(*)
begin
	case(SEL)
	'b0:
	begin
		out<=IN1;
	end
	'b1:
	begin
		out<=IN2;
	end
	
	default:
	begin	
		out<=0;
	end
	
	endcase

end
endmodule