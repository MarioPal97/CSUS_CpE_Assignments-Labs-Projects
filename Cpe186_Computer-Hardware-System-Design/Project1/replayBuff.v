module replayBuff (input clk, reset_n, tim_out, we,
				   input [1:0] ack_nak,
				   input [11:0] seq,
				   input [15:0] din,
				   output reg ready,
				   output reg [15:0] dout);

	reg [15:0] packetHolder [4095:0];
	integer cnt_Wr, cnt_Rd; 

	always@(posedge clk or negedge reset_n)
	begin
		if(!reset_n)
		begin
			dout <= 16'b0;
			cnt_Rd = 0; cnt_Wr = 0;
		end
		else if(tim_out) // checking for ack_nak timeout
		begin
			dout = 16'b0;
		end
		else begin
			if(ack_nak == 01 || ack_nak == 10)	// checking on ack_nak is working
			begin
				if(!we && !(cnt_Wr == 0)) // should read after ack
				begin
					dout = packetHolder[seq[9:0]];
					cnt_Rd = cnt_Rd + 1;
					if(cnt_Wr == 4095) cnt_Wr = 0;
				end
				else dout = 0;
			end
			else begin	// no ack for DLLP
				if(we && !(cnt_Wr == 4095))	// overwriting
				begin
					packetHolder[seq[9:0]] = din;
					cnt_Wr = cnt_Wr + 1;
					if(cnt_Rd == 4095) cnt_Rd = 0;
				end
				else dout = 16'b0;
			end
		end
	end

	always@(posedge clk or negedge reset_n)
	begin
		if(!reset_n || tim_out) ready = 1;
		if (cnt_Rd == 4095) ready = 0; 
	end
endmodule
