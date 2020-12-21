`timescale 1ns / 1ps
module arbiter(clk,clr,PCIe,id);
	input 			 clk, clr;
	input 	   [7:0] PCIe;
	output reg [7:0] id;
	
	reg [1:0] cs, ns;
	reg [3:0] vc, nvc;
	reg [3:0] state = 0;
	reg v4=0, v3=0, v2=0, v1=0, v0=0;
	
	parameter vc7=4'b0111, vc6=4'b0110, vc5=4'b0101, vc4=4'b0100, 
			  vc3=4'b0011, vc2=4'b0010, vc1=4'b0001, vc0=4'b0000,
			  idle=4'b1000, start=4'b1111;
	
	always @ (posedge clk or negedge clr)
	if(clr) 
	begin
		cs <= 2'b00;
		vc <= start;
	end 
	else 
	begin 
		cs <= ns;
		vc <= nvc;
	end 
	
	//FSM
	always @ (*) 
	begin 
		case(vc)
			vc7:
				begin 
					id = 8'b10000000;
					if (PCIe[6])
						nvc <= vc6; 
					else if (!PCIe[6] && PCIe[5]) 
						nvc <= vc5;
					else 
					begin
						if (state == 0) 
						begin
							if (PCIe[4]) nvc <= vc4;
							else if (PCIe[3]) nvc <= vc3;
							else if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle; 
						end
						if (state == 1) 
						begin
							if (PCIe[3]) nvc <= vc3;
							else if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle; 
						end
						if (state == 2) 
						begin
							if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle; 
						end
						if (state == 3) 
						begin
							if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle; 
						end
						else
						begin
							if (PCIe[0]) nvc <= vc0;
							else nvc <= idle;
						end
					end
				end
			vc6:
				begin
					id = 8'b01000000;
					if (PCIe[5]) 
						nvc <= vc5;
					else
					begin
						if (state == 0) 
						begin
							if(PCIe[4]) nvc <= vc4;
							else if (PCIe[3]) nvc <= vc3;
							else if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle;
						end
						if (state == 1) 
						begin
							if(PCIe[3]) nvc <= vc3;
							else if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle;
						end
						if (state == 2) 
						begin 
							if(PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle;
						end
						if (state == 3) 
						begin
							if(PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= idle;
						end
						else 
						begin
							if (PCIe[0]) nvc <= vc0;
							else nvc <= idle;
						end
					end
				end
			vc5:
				begin
					id = 8'b00100000;
					if (state == 0)
					begin
						if (PCIe[4]) nvc <= vc4;
						else if (PCIe[3]) nvc <= vc3;
						else if (PCIe[2]) nvc <= vc2;
						else if (PCIe[1]) nvc <= vc1;
						else if (PCIe[0]) nvc <= vc0;
						else nvc <= idle; 
					end
					if (state == 1)
					begin
						if (PCIe[3]) nvc <= vc3;
						else if (PCIe[2]) nvc <= vc2;
						else if (PCIe[1]) nvc <= vc1;
						else if (PCIe[0]) nvc <= vc0;
						else nvc <= idle; 
					end
					if (state == 2)
					begin
						if (PCIe[2]) nvc <= vc2;
						else if (PCIe[1]) nvc <= vc1;
						else if (PCIe[0]) nvc <= vc0;
						else nvc <= idle; 
					end
					if (state == 3)
					begin
						if (PCIe[1]) nvc <= vc1;
						else if (PCIe[0]) nvc <= vc0;
						else nvc <= idle; 
					end
					else
					begin
						if(PCIe[0]) nvc <= vc0;
						else nvc <= idle;
					end
				end
			vc4:
				begin
					id = 8'b00010000;
					v4 = 1'b1;
					if (state == 1) nvc <= idle;
					else
					begin
						if (PCIe[3]) nvc <= vc3;
						else if (PCIe[2]) 
						begin
							if (v2 == 1'b0)
							begin
								nvc <= vc2;
							end
							else nvc <= idle; 
						end
						else if (PCIe[1]) 
						begin
							if (v1 <= 1'b0)
							begin
								nvc <= vc1;
							end
							else nvc <= idle;
						end
						else nvc <= idle;
					end
				end
			vc3:
				begin
					id = 8'b00001000;
					v3 = 1'b1;
					if (state == 2) nvc <= idle;
					else
					begin
						if (PCIe[2]) nvc <= vc2;
						else if (PCIe[1]) nvc <= vc1;
						else if (PCIe[0]) nvc <= vc0;
						else nvc <= idle;
					end
				end
			vc2:
				begin
					id = 8'b00000100;
					v2 = 1'b1;
					if (state == 3) nvc <= idle;
					else
					begin
						if (PCIe[1]) nvc <= vc1;
						else if (PCIe[0]) nvc <= vc0;
						else nvc <= idle;
					end
				end
			vc1:
				begin
					id = 8'b00000010;
					v1 = 1'b1;
					if (state == 4) nvc <= idle;
					else
					begin
						if (PCIe[0]) nvc <= vc0;
						else
						begin
							if (PCIe[4])
							begin
								if (v4 == 1'b0)
								begin
									nvc <= vc4;
								end
								else nvc <= idle;
							end
							else nvc <= idle;
						end
					end
				end
			vc0:
				begin
					id = 8'b00000001;
					v0 = 1'b1;
					if (state == 0) nvc <= idle;
					else
					begin
						if (PCIe[4]) nvc <= vc4;
						else nvc <= idle;
					end
				end
			idle:
				begin
					id = 8'b00000000;
					v4=1'b0; v3=1'b0; v2=1'b0; v1=1'b0; v0=1'b0;
					if (state == 5) state = 0;
					else
						state = state + 1;
						nvc <= start;
				end
			start:
				begin
					id = 8'b00000000;
					if (PCIe[7]) nvc <= vc7;
					else if (PCIe[6]) nvc <= vc6; 
					else if (PCIe[5]) nvc <= vc5;
					else
					begin
						if (state == 0)
						begin
							if (PCIe[4]) nvc <= vc4;
							else if (PCIe[3]) nvc <= vc3;
							else if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= start;
						end
						else if (state == 1)
						begin
							if (PCIe[3]) nvc <= vc3;
							else if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= start;
						end
						else if (state == 2)
						begin
							if (PCIe[2]) nvc <= vc2;
							else if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= start;
						end
						else if (state == 3)
						begin
							if (PCIe[1]) nvc <= vc1;
							else if (PCIe[0]) nvc <= vc0;
							else nvc <= start;
						end
						else 
						begin
							if (PCIe[0]) nvc <= vc0;
							else nvc <= start;
						end
					end
				end
			default: 
				id = 8'b00000000;
		endcase
	end
endmodule