`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2022 20:37:29
// Design Name: 
// Module Name: Count_case
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
This module is a counter. This counter increases its value whenever a signal click
is 1. There is also a reset signal that makes the counter 0 whenever it is active.
*/
module Count_case(clk, reset, sec_count, count_case);
    
    input clk, reset;
    input [22:0] sec_count;
    output [3:0] count_case;
    reg [3:0] count_case;

    always @ (posedge clk or posedge reset)
    begin
        if(reset)
            count_case <= 0;
        else if(sec_count == 23'b0)
            count_case <= count_case + 1;
        else count_case <= count_case;
    end
       
endmodule
