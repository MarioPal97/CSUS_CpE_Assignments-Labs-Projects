`include "topLevel.v"
module topLevel_tb;
	reg clk, reset_n, busy_n, tim_out, we;
	reg [1:0] ack_nak;
	reg [15:0] din;
	reg [11:0] seq;
	wire ready;
	wire [15:0] dout;

    initial
        $vcdpluson;

	topLevel t1 (.clk(clk), .reset_n(reset_n), .busy_n(busy_n), .tim_out(tim_out), .we(we), .ack_nak(ack_nak), .din(din), .seq(seq), .ready(ready), .dout(dout));

	always@(posedge clk)
	begin
		$display("		Clock 		= %b 	Reset 	 	= %b", clk, reset_n);
		$display("		Data In 	= %h 	Sequence 	= %h", din, seq);
		$display("		Ack/Nak 	= %b 	Timeout  	= %b", ack_nak, tim_out);
		$display("		Busy 		= %b 	Reday 		= %b", busy_n, ready);
		$display("			  Write Enable		= %b", we);
		$display("			  Data Out 			= %h\n\n", dout);
	end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

	initial
	begin
			 reset_n = 1; busy_n = 0; tim_out = 0; we = 0;
			 din = 16'h0001; seq = 12'h001; ack_nak = 2'b00;
		#100; reset_n = 0;
		#10; we = 1; busy_n = 1;
		#10; ack_nak = 2'b10; we = 0;
		#100; reset_n = 1; 
		#10; we = 1;
		#10; tim_out = 1;
		#10; $finish;  
	end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
    end
endmodule
