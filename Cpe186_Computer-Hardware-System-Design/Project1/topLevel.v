`include "fsm.v"
`include "replayBuff.v"
module topLevel (input clk, reset_n, busy_n, tim_out, we,
				 input [1:0] ack_nak,
				 input [15:0] din,
				 input [11:0] seq,
				 output ready,
				 output [15:0] dout);

	fsm f1(.reset_n(reset_n), .clk(clk), .ack_nak(ack_nak), .tim_out(tim_out), .busy_n(busy_n), .we(we)); 
	replayBuff r1(.clk(clk), .reset_n(reset_n), .tim_out(tim_out), .we(we), .ack_nak(ack_nak), .seq(seq), .din(din), .ready(ready), .dout(dout));
endmodule
