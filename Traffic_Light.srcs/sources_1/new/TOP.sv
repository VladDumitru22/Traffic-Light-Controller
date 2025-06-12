`timescale 1ns / 1ps

module TOP(
    input logic clk_100MHz,
    input logic reset,
    input logic pedestrian_request,
    
    output logic pedestrian_red,
    output logic pedestrian_green,
    output logic pedestrian_blue,
    
    output logic car_red,
    output logic car_green,
    output logic car_blue
    );
    
    logic clk_div_out;
    logic or_gate_out;
    logic [2:0] fsm_counter_max_out;
    logic [2:0] counter_out;
    logic fsm_counter_rst_out;
    logic flip_flop_out;
    
    clk_div clk_div_inst(
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .clk_1Hz(clk_div_out)
    );
    
    counter counter_inst(
        .clk(clk_100MHz),
        .rst(or_gate_out),
        .counter_max(fsm_counter_max_out),
        .counter(counter_out)
    );
    
    FSM FSM_inst(
        .clk(clk_100MHz),
        .reset(reset),
        .pedestrian_request(pedestrian_request),
        .counter(counter_out),
        
        .counter_rst(fsm_counter_rst_out),
        .counter_max(fsm_counter_max_out),
        
        .pedestrian_red(pedestrian_red),
        .pedestrian_green(pedestrian_green),
        .pedestrian_blue(pedestrian_blue),
        
        .car_red(car_red),
        .car_green(car_green),
        .car_blue(car_blue)
    );
    
    flip_flop flip_flop_inst(
        .clk(clk_100MHz),
        .reset(reset),
        .counter_rst(fsm_counter_rst_out),
        .out(flip_flop_out)
    );
    
    or_gate or_gate_inst(
        .reset(reset),
        .ff(flip_flop_out),
        .out(or_gate_out)
    );
    
endmodule

