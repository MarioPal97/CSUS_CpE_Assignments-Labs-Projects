`timescale 1ns / 1ps
module LCRC(clk, reset, in, out);
    input clk, reset;
    input [15:0] in;
    output reg [31:0] out;
    
	integer byteCount, bitCount;
	
	reg [15:0] tmp;
	reg [7:0] byte;
    reg [31:0] current;
	reg [31:0] previous;
	reg xorBit;

    always @(posedge clk)
    begin
        if(reset)
        begin
            out = 0;
            previous[31:0] <= 32'b0000_0100_1100_0001_0001_1101_1011_0111;
			byteCount = 2;
			bitCount = 1;
			byte = in[7:0];
        end
		else
		begin
			byteCount = 2;
			bitCount = 1;
			byte = in[7:0];
			for(byteCount = 2; byteCount > 0; byteCount = byteCount - 1)
			begin
				for(bitCount = 1; bitCount <= 8; bitCount = bitCount + 1)
				begin
					xorBit = previous[31] ^ byte[bitCount - 1];
				
					current[0] = xorBit;
					current[1] = previous[0] ^ xorBit;
					current[2] = previous[1] ^ xorBit;
					current[3] = previous[2];
					current[4] = previous[3] ^ xorBit;
					current[5] = previous[4] ^ xorBit;
					current[6] = previous[5];
					current[7] = previous[6] ^ xorBit;
					
					current[8] = previous[7] ^ xorBit;
					current[9] = previous[8];
					current[10] = previous[9] ^ xorBit;
					current[11] = previous[10] ^ xorBit;
					current[12] = previous[11] ^ xorBit;
					current[13] = previous[12];
					current[14] = previous[13];
					current[15] = previous[14];
					
					current[16] = previous[15] ^ xorBit;
					current[17] = previous[16];
					current[18] = previous[17];
					current[19] = previous[18];
					current[20] = previous[19];
					current[21] = previous[20];
					current[22] = previous[21] ^ xorBit;
					current[23] = previous[22] ^ xorBit;
					
					current[24] = previous[23];
					current[25] = previous[24];
					current[26] = previous[25] ^ xorBit;
					current[27] = previous[26];
					current[28] = previous[27];
					current[29] = previous[28];
					current[30] = previous[29];
					current[31] = previous[30];
					
					//output arrangment
					out[31] = current[24];
					out[30] = current[25];
					out[29] = current[26];
					out[28] = current[27];
					out[27] = current[28];
					out[26] = current[29];
					out[25] = current[30];
					out[24] = current[31];
					
					
					out[23] = current[16];
					out[22] = current[17];
					out[21] = current[18];
					out[20] = current[19];
					out[19] = current[20];
					out[18] = current[21];
					out[17] = current[22];
					out[16] = current[23];
					
					
					out[15] = current[8];
					out[14] = current[9];
					out[13] = current[10];
					out[12] = current[11];
					out[11] = current[12];
					out[10] = current[13];
					out[9] = current[14];
					out[8] = current[15];
					
					
					out[7] = current[0];
					out[6] = current[1];
					out[5] = current[2];
					out[4] = current[3];
					out[3] = current[4];
					out[2] = current[5];
					out[1] = current[6];
					out[0] = current[7];
	
					previous = current;
				end
				tmp = (in >> ( (byteCount - 1) * 8));
				byte = tmp[7:0];
			end
		end
	end
endmodule
