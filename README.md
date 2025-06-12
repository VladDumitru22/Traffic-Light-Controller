# Traffic Light Controller with Pedestrian Button

## Description

This project implements a traffic light controller using SystemVerilog with a modular design.  
The controller includes a pedestrian push button to safely manage pedestrian crossings.  
The system is based on a finite state machine (FSM) controlling the traffic and pedestrian signals.

## Project Structure

The design is split into multiple SystemVerilog modules for clarity and reuse:

- `FSM.sv` — Finite State Machine handling the main control logic  
- `TOP.sv` — Top-level module that integrates all components  
- `clk_div.sv` — Clock divider module  
- `counter.sv` — Counter module used in timing operations  
- `flip_flop.sv` — Flip-flop module for state storage  
- `or_gate.sv` — Simple OR gate module  
- `testbench.sv` — Testbench for simulating and verifying the design  

## Files

- SystemVerilog source files as above  
- `Traffic_Light.xpr` — Vivado project file  
- `constraints.xdc` — FPGA pin constraints file  

## How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/Your_Name/Traffic-Light-Controller.git
   cd Traffic-Light-Controller


