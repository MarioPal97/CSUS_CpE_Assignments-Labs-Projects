module myMULT(da,db,sftb,load,clr,sftp,loadp,clk,p);
	input 		 sftb,load,sftp,loadp,clk,clr;
	input  [3:0] da,db;
	output [7:0] p;
	wire 		 cout;
	wire   [3:0] empty,qa,qb,a,mux_out,fa_out;
	
	assign empty = 4'b0000;
	
	myMA g1 (clk,clr,load,load,da,qa);
	myMB g2 (clk,clr,load,sftb,db,qb);
	myMUXB g3 (.d1(qa).d0(empty),.s(qb[0]),.y(mux_out);
	myADDER g4 (.a(p[7:4]),.b(mux_out),.sum(fa_out),cout);
	myPROD g5 (.sum(fa_out),cout,sftp,loadp,clr,p,clk);
endmodule 

////////////////////////////////////////////
module myMULT_tb();
	reg 	   sftb,load,sftp,loadp,clk,clr;
	reg  [3:0] da,db;
	wire [7:0] p;
	
	myMULT uut(da,db,sftb,load,clr,sftp,loadp,clk,p);
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin 
		da = 4'b1011; db = 4'b1101; load = 0;
		sftb = 0; clr = 1; sftp = 0; loadp = 0;
		
		#20 clr = 0; 
		#20 load = 1;
		#20 load = 0;
		
		#20 loadp = 1;
		#20 loadp = 0;
		
		#20 sftb = 1;
		#20 sftb = 0;
		
		#20 sftp = 1;
		#20 sftp = 0;
		
		#40 $stop;
 	end 
endmodule 