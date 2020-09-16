`timescale 1ns / 1ps
module mux4to1_tb();
    reg [3:0] d0,d1,d2,d3;
    reg [2:0] select;
    wire [3:0] y;
    
    mux4to1 utt(d0,d1,d2,d3,select,y);
    
    initial begin
            d0=0; d1=1; d2=2; d3=3; select=2'b00;
        #10 d0=0; d1=1; d2=2; d3=3; select=2'b01;
        #10 d0=0; d1=1; d2=2; d3=3; select=2'b10;
        #10 d0=0; d1=1; d2=2; d3=3; select=2'b11;
        #20 $stop;
    end
endmodule
