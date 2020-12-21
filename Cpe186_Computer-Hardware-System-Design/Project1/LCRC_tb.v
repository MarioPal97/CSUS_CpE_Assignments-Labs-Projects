`include "LCRC.v"
module LCRC_tb;

reg [15:0] in;
reg clk, reset;
wire [31:0] out;


initial 
	$monitor ($time, " input = %h output = %h", in, out);
	

LCRC LCRC_instant(.clk(clk), .reset(reset), .in(in), .out(out));

initial begin
    clk = 0;
    forever #5 clk <= ~clk;
end

initial begin

	        reset = 1; in=16'b0;
	#10;	reset = 0; in=16'b0001_0010_1010_1011;  //enters 12ABhex, outputs EA0F_7F5Fhex
    #10;    in=16'b1111_1110_1000_0111;             //enters FE87hex without resetting, outputs 1F88_E91Ahex
        #10     $finish;

end
endmodule