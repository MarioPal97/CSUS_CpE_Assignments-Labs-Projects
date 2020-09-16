module myPROD(sum,shiftp,loadp,clr,clk,cout,p);
	input       shiftp,loadp,clr,clk,cout;
	input [3:0] sum;
	output[7:0] p;
	reg   [7:0] p;
	
	always@(posedge clr or posedge clk)
	begin 
		if(clr) p <= 0;
		else if (loadp) p[7:3] <= {cout,sum};
		else if (shiftp) begin 
			p[7:3] <= {1'b0, p[7:4];		//PH
			p[2:0] <= {p[3], p[2:1]};		//PL 
		end 
	end 
endmodule 

module myPROD_tb();
	reg        cin,shiftp,loadp,clr,clk;
	reg  [3:0] sum;
	wire [7:0] p;
	
	myPROD uut(sum,shiftp,loadp,clr,clk,p,cin);
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin 
		sum = 4'b1011; cin = 1; shiftp = 0; loadp = 0; clr = 1;
		#20 clr = 0;
		#20 shiftp = 1;
		#20 loadp = 1;
		#20 loadp = 0;
		#40 $stop;
	end
endmodule 