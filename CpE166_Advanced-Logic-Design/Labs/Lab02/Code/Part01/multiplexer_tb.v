`timescale 1ns / 1ps

module multiplexer_tb;
    reg [1:0] d;
    reg       s; 
    wire      y;
    multiplexer u1(.d(d),.s(s),.y(y));
    initial begin
        d = 2'b10; s = 0;
        #10;
        d = 2'b01; s = 0;
        #10;
        d = 2'b10; s = 1;
        #10;
        d = 2'b01; s = 1;
        #20 $stop;
    end
endmodule 
