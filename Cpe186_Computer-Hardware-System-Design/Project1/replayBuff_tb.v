module replayBuffer_tb;
	reg clk, reset_n, tim_out, we;
	reg [1:0] ack_nak;
	reg [11:0] seq;
	reg [15:0] din;
	wire ready;
	wire [15:0] dout;

	replayBuffer r1 (clk, reset_n, tim_out, we, ack_nak, seq, din, ready, dout);

	initial
		$monitor ("Reset = %b TimeOut = %b we = %b Seq. = %b ack_nak = %b Ready = %b Din = %h Dout = %h",
				  reset_n, tim_out, we, seq, ack_nak, ready, din, dout); 

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
			reset_n = 1; tim_out = 0; we = 1;
		#10 reset_n = 0;
		#10 reset_n = 1;

		if(ready)
		begin
			for (integer i = 0; i < 4; i = i + 1)
			begin
				#10 ack_nak = 0; we = 1; tim_out = 0;
				if (i == 2) tim_out = 1;
				seq = i;
				din = i; 
			end
			f
			for (integer j = 0; j < 4; j = j + 1)
			begin
				#10 ack_nak = 1; tim_out = 0; seq = 1;
			end
		end
		else tim_out = 1;
		#10000 $finish;
	end
endmodule