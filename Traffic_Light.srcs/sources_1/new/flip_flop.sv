`timescale 1ns / 1ps

module flip_flop(
    input logic clk,
    input logic reset,
    input logic counter_rst,
    
    output logic out
    );
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset == 1) begin
            out <= 0;
        end
        else begin
            out <= counter_rst;
        end
    end
    
endmodule
