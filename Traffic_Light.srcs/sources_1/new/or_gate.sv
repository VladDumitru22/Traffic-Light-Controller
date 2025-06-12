`timescale 1ns / 1ps

module or_gate(
    input logic reset,
    input logic ff,
    
    output logic out
    );
    
    assign out = reset | ff;
    
endmodule
