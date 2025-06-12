`timescale 1ns / 1ps

module counter(
    input logic clk,
    input logic rst,
    input logic [2:0] counter_max,
    
    output logic [2:0] counter
    );
    
    always_ff @(posedge clk, posedge rst)begin
        if(rst == 1) begin
            counter <= 0;
        end
        else begin
            if(counter >= counter_max) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
    
endmodule
