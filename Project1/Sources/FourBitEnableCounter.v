`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2022 19:32:30
// Design Name: 
// Module Name: FourBitEnableCounter
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
This module is a counter that increases its output when a signal
enable is 1. In other words this module implements a counter that
increases when a button is pressed. There is also a signal reset
that sets the counter to 0.
*/
module FourBitEnableCounter(clk,reset,enable,count);
    
    input clk;
    input reset;
    input enable;
    output [3:0] count;
    reg [3:0] count;
    
    // If reset make the counter = 0, else increase the counter when enable is 1 (16 states)
    always@(posedge clk or posedge reset)
    begin
        if (reset)
            count <= 4'b0;
        else
            if(enable == 1)
                count <= count + 1;
            else
                count <= count;
    end
endmodule
