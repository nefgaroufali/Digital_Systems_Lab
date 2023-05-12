`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2022 18:47:09
// Design Name: 
// Module Name: debounce
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
This is a module that implements a debouncer. A debouncer consists of a slowclock input,
2 D-FlipFlops and an AND gate.
*/

module debounce(pushB_in, clk, pushB_out);
    
    input pushB_in;
    input clk;
    output pushB_out;
    
    wire Q1, Q2, Q2_bar;

    DFF d1(clk, pushB_in, Q1);
    DFF d2(clk, Q1, Q2);
    
    assign Q2_bar = ~Q2;
    assign pushB_out = Q1 & Q2_bar;
    
endmodule
