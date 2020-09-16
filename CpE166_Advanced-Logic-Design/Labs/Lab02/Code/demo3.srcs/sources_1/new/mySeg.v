`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Mario Palacios
// Course: CpE166 - Section 
// Create Date: 03/02/2020 11:46:38 AM
// Design Name: Lab02 - Part 03
// Module Name: mySeg
//////////////////////////////////////////////////////////////////////////////////


module mySeg(clk,seg,dig);
    input        clk;
    output  [7:0] seg,dig;
    
    parameter N = 18;
    
    reg [N-1:0] count;
    reg [3:0]   dd;
    reg [7:0]   seg;
    reg [7:0]   an;
    
    always @ (posedge clk)
    begin 
        count <= count + 1;
        
        case(count[N-1:N-3])
        3'b000:
        begin 
            dd = 4'd7;
            an = 8'b11111110;
        end
        3'b001:
        begin 
            dd = 4'd6;
            an = 8'b11111101;
        end 
        3'b010:
        begin 
            dd = 4'd5;
            an = 8'b11111011;
        end
        3'b011:
        begin 
            dd = 4'd4;
            an = 8'b11110111;
        end
        3'b100:
        begin 
            dd = 4'd3;
            an = 8'b11101111;
        end
        3'b101:
        begin 
            dd = 4'd2;
            an = 8'b11011111;
        end
        3'b110:
        begin 
            dd = 4'd1;
            an = 8'b10111111;
        end
        3'b111:
        begin 
            dd = 4'd0;
            an = 8'b01111111;
        end
     endcase 
  end
  
  assign dig = an;
  
  always @ (dd)
  begin
    seg[7] = 1'b1;
    case(dd)
        4'd0 : seg[6:0] = 7'b1000110;    //C
        4'd1 : seg[6:0] = 7'b0001100;    //P
        4'd2 : seg[6:0] = 7'b0000110;    //E
        4'd3 : seg[6:0] = 7'b1111001;    //1
        4'd4 : seg[6:0] = 7'b0000010;    //6
        4'd5 : seg[6:0] = 7'b0000010;    //6
        4'd6 : seg[6:0] = 7'b0001001;    //M?
        4'd7 : seg[6:0] = 7'b0001100;    //P
        default: seg [6:0] = 7'b11111111; //blank
    endcase
  end
endmodule
