module TOP(rst,clk,da,db,p);
	input 		 rst,clk;
	input  [3:0] da,db;
	output [7:0] p;
	wire sftb,load,clr,loadp,sftp;
	
	myMULT g1(da,db,sftb,load,clr,sftp,loadp,clk,p);
	myFSM g2(rst,clk,sftb,load,clr,loadp,sftp);
endmodule 

module TOP_TEST();
	reg 	   rst,clk;
	reg  [3:0] da,db;
	wire [7:0] p;
	
	TOP uut(rst,clk,da,db,p);
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin 
		da = 4'b1011; db = 4'b1101; rst = 1;
		#20 rst = 0;
		#60 $stop;
	end
endmodule 