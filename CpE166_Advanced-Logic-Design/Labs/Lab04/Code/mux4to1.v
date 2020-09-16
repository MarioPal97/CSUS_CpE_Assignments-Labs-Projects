`timescale 1ns / 1ps
module mux4to1(d0,d1,d2,d3,select,y);
    input      [1:0] select; 
    input      [3:0] d0,d1,d2,d3;
    output reg [3:0] y;
    
    always@(d0 or d1 or d2 or d3 or select) begin
        case(select)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d3;
        endcase
    end
endmodule
