`include "arbiter.v"
module arbiter_tb;

	reg clk, clr;
	reg [7:0] PCIe;
	wire [7:0] id;

	initial 
		$monitor ($time, " Reset = %b, PCIe = %b, VC ID = %b", clr, PCIe, id);
		

	arbiter arbiter_instant (.clk(clk), .clr(clr), .PCIe(PCIe), .id(id));

	initial begin
	    clk = 0;
	    forever #5 clk = ~clk;
	end

	initial begin
		    	clr=1; PCIe=8'b10100110;
		#10;	clr=0;
	    #60;    PCIe=8'b00000110;
	    #40;    PCIe=8'b00001110;
	    #20;    PCIe=8'b01001110;
	    #20;    PCIe=8'b00001110;
	    #50     $finish;

	end
endmodule
