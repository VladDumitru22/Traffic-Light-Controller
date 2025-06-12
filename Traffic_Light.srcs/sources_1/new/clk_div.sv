`timescale 1ns / 1ps

module clk_div(
    input logic clk_100MHz,
    input logic reset,
    
    output logic clk_1Hz
    );
    
    logic [25:0] counter;
    
    always_ff @(posedge clk_100MHz, posedge reset) begin
        if(reset == 1) begin
            clk_1Hz <= 0;
            counter <= 0;           
        end
        else begin
            if(counter == 50_000_000 - 1) begin
                clk_1Hz <= ~clk_1Hz;
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
    
endmodule
