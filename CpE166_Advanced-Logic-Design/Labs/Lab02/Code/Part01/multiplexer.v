`timescale 1ns / 1ps

module multiplexer(d,s,y);
    input [1:0]d;
    input      s;
    output     y;
    wire       m,n;
    
    assign m = (~s)&d[0];
    assign n = s&d[1];
    assign y = m|n;
    
endmodule
