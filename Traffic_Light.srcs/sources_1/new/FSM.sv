`timescale 1ns / 1ps

module FSM(
    input logic clk,
    input logic reset,
    input logic pedestrian_request,
    input logic [2:0] counter,
    
    output logic counter_rst,
    output logic [2:0] counter_max,
    
    output logic pedestrian_red,
    output logic pedestrian_green,
    output logic pedestrian_blue,
    
    output logic car_red,
    output logic car_green,
    output logic car_blue
    );

    localparam Q0 = 3'b000;
    localparam Q1 = 3'b001;
    localparam Q2 = 3'b010;
    localparam Q3 = 3'b011;

    logic [2:0] state, state_next;
    logic [2:0] counter_max_internal;
    logic counter_rst_ff;

    assign counter_max = counter_max_internal;

    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            state <= Q0;
            counter_rst_ff <= 0;
        end
        else begin
            state <= state_next;
            counter_rst_ff <= (state != state_next);
        end
    end

    always_comb begin
        state_next = state;
        case(state)
            Q0: begin
                if(counter == counter_max_internal) state_next = Q1;
            end
            Q1: begin
                if(pedestrian_request == 1) state_next = Q2;
                else if(counter == counter_max_internal) state_next = Q3;
            end
            Q2: begin
                if(counter == counter_max_internal) state_next = Q3;
                else if(pedestrian_request == 0) state_next = Q1;
            end
            Q3: begin
                if(counter == counter_max_internal) state_next = Q0;
            end
            default: state_next = Q0;
        endcase
    end

    always_comb begin
        car_red = 0;
        car_green = 0;
        car_blue = 0;
        pedestrian_red = 0;
        pedestrian_green = 0;
        pedestrian_blue = 0;
        counter_max_internal = 0;

        case(state)
            Q0: begin
                car_red = 1;
                pedestrian_green = 1;
                counter_max_internal = 7;
            end
            Q1: begin
                car_green = 1;
                pedestrian_red = 1;
                counter_max_internal = 7;
            end
            Q2: begin
                car_green = 1;
                pedestrian_red = 1;
                counter_max_internal = 3;
            end
            Q3: begin
                car_red = 1;
                car_green = 1;
                pedestrian_red = 1;
                counter_max_internal = 3;
            end
        endcase
    end

    assign counter_rst = counter_rst_ff;

endmodule
