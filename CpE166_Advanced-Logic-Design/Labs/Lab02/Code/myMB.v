`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE 166 - Section 01
// Create Date: 02/17/2020 12:28:50 PM
// Design Name: Lab02 Part02
// Module Name: myMB
//////////////////////////////////////////////////////////////////////////////////


module myMB (clk,clr,load,sft,db,qb);
	input clk, clr, load, sft;
	input [3:0] db;
	output [3:0] qb;
	reg [3:0] qb;
	always@(posedge clr or posedge clk)
	begin
		if(clr) qb <= 0;
		else if (load)
		qb <= db;
		else if (sft)
		qb <= { 1'b0, qb[3:1] };	//This does the shifting
	end
endmodule
