`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/10/2020 12:17:02 PM
// Design Name: Lab 02
// Module Name: myMUXB_tb
//////////////////////////////////////////////////////////////////////////////////


module myMUXB_tb();
    reg [3:0]  d0,d1;
    reg        s;
    wire [3:0] y;
    
    myMUXB utt(d0,d1,y,s);
    initial 
    begin 
			d1 = 4'b0000; d0 = 4'b0000; s = 0;
		#10 d1 = 4'b0011; d0 = 4'b1000; s = 0;
		#10 d1 = 4'b0000; d0 = 4'b0001; s = 0;
		#10 d1 = 4'b0010; d0 = 4'b0101; s = 1;
		#10 d1 = 4'b0011; d0 = 4'b1000; s = 1;
		#10 d1 = 4'b1100; d0 = 4'b0011; s = 1;
		#10 $stop;
    end
endmodule
