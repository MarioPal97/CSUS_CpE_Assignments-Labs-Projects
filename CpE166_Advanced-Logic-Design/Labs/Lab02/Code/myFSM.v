module myFSM(rst,clk,sftb,load,clr,loadp,,sftp);
	input     clk,rst;
	output    sftb,load,clr,loadp,sftp;
	reg       sftb,load,clr,loadp,sftp;
	reg [3:0] cs,ns;
	
	parameter s0 = 0, s1 =1, s2 =2, s3 = 3, s4 = 4
			  s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9,
			  s10 = 10, s11 = 11, s12 = 12, s13 = 13;

	always @(posedge clk or posedge rst) begin 
		if(rst) cs <= s0;
		else cs <= ns;
	end 
	always @(cs) begin
		case(cs)
		s0: ns = s1;
		s1: ns = s2;
		s2: ns = s3;
		s3: ns = s4;
		s4: ns = s5;
		s5: ns = s6; 
		s6: ns = s7;
		s7: ns = s8;
		s8: ns = s9;
		s9: ns = s10;
		s10: ns = s11;
		s11: ns = s12;
		s12: ns <= s12;
		default: ns <= s0;
		endcase
	end
	
	always @(cs) begin 
		case(cs)
			s0:begin 
			clr = 1;load = 0;sftb = 0;sftp = 0;loadp = 0;
			end
			
			s1:begin 
			clr = 0;load = 1;sftb = 0;sftp = 0;loadp = 0;
			end
			
			s2:begin 
			clr = 0;load = 0;sftb = 0;sftp = 0;loadp = 1;
			end
			s3:begin 
			clr = 0;load = 0;sftb = 0;sftp = 1;loadp = 0;
			end
			
			s4:begin 
			clr = 0;load = 0;sftb = 1;sftp = 0;loadp = 0;
			end
			
			s5:begin 
			clr = 0;load = 0;sftb = 0;sftp = 0;loadp = 1;
			end
			
			s6:begin 
			clr = 0;load = 0;sftb = 0;sftp = 1;loadp = 0;
			end
			
			s7:begin 
			clr = 0;load = 0;sftb = 1;sftp = 0;loadp = 0;
			end
			
			s8:begin 
			clr = 0;load = 0;sftb = 0;sftp = 0;loadp = 1;
			end
			
			s9:begin 
			clr = 0;load = 0;sftb = 0;sftp = 1;loadp = 0;
			end
			
			s10:begin 
			clr = 0;load = 0;sftb = 1;sftp = 0;loadp = 0;
			end
			
			s11:begin 
			clr = 0;load = 0;sftb = 0;sftp = 0;loadp = 1;
			end
			
			s12:begin 
			clr = 0;load = 0;sftb = 0;sftp = 0;loadp = 0;
			end
			
			default:begin 
			clr = 0;load = 0;sftb = 0;sftp = 0;loadp = 0;
			end
		endcase
	end 	
endmodule  