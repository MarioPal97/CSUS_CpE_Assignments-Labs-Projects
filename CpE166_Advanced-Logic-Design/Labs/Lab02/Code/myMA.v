module myMA (clk, clr, load, db, qb); 
	input clk, clr, load;
	input [3:0] db;
	output [3:0] qb;
	reg [3:0] qb;
	always@(posedge clr or posedge clk)
	begin
	if(clr) qb <= 0;
	else if (load)
	qb <= db;
	end
	/*else if (sft)
	qb <= { 1'b0, qb[3:1] };
	// qb[3] <= 1'b0;
	// qb[2] <= qb[3];
	// qb[1] <= qb[2];
	// qb[0] <= qb[1];
	*/
endmodule

////////////////////////////////////////////////
module myMA_tb();
	reg [3:0] db;
	reg clk, clr, load;
	wire [3:0] qb;
	
	dffb uut (clk, clr, load);
	
	initial clk = 0;
	always #10 clk = ~ clk;
	initial
	begin
		clr = 1; load = 0; db = 4'b1011;
		#22 clr=0;
		load = 1;
		#20 load = 0;
		#60 $stop;
	end
endmodule