`timescale 1ns / 1ps

module testbench();

logic clk_100MHz;
logic reset;
logic pedestrian_request;
    
logic pedestrian_red;
logic pedestrian_green;
logic pedestrian_blue;
    
logic car_red;
logic car_green;
logic car_blue;

TOP TOP_inst(.*);

initial begin
    clk_100MHz = 0;
    forever begin
        #5 clk_100MHz = ~clk_100MHz;
    end
end

initial begin
    pedestrian_request = 0;
    reset = 1;
    
    #15 reset = 0;
    #100 pedestrian_request = 1;
    #50 pedestrian_request = 0;
    
    #300 $stop;
end

endmodule
