module fsm(reset_n, clk, ack_nak, tim_out, busy_n, we);
	input reset_n, clk, tim_out, busy_n, we;
	input [1:0] ack_nak;

	reg ready;

	reg[2:0] cs, ns;
	parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, 
			  s3 = 3'b011, s4 = 3'b100;

	always@(cs or tim_out or we or ack_nak or busy_n)
	begin
		case(cs)
			s0:
				if (busy_n) ns = s1;
				else ns = s0;
			s1:
				if(we) ns = s2;
				else if(tim_out) ns = s4;
				else if(ack_nak == 2'b01) ns = s3;
				else if(ack_nak == 2'b10) ns = s4;
				else ns = s1;
			s2:
                ns = s1;
				//if (tim_out) ns = s4;
				//else ns = s1;
			s3:
                ns = s1;
				//if (ack_nak == 2'b10) ns = s4; 
				//else ns = s1;
			s4:
                ns = s1;
				//if (ack_nak == 2'b01) ns = s3;
				//else ns = s1;
			default: ns = s0;
		endcase
	end

	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n) cs <= s0;
		else cs <= ns;
	end

endmodule
