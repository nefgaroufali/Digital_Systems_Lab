`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2022 18:46:53
// Design Name: 
// Module Name: FourBit_Counter
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
This module is a counter. There is a 4bit output to represent 2^4 = 16 states.
This clock is asynchronous with reset. As it is a sequential circuit we use
non-blocking assignments.
*/
module FourBit_Counter(clk, reset, count);
    input clk, reset;
    output [3:0] count;
    reg [3:0] count;

    // If reset make the counter = 0, else increase the counter (16 states)
    always@(posedge clk or posedge reset)
    begin
        if (reset)
            count <= 4'b0;
        else
            count <= count + 1;
    end
    
    
    
endmodule
