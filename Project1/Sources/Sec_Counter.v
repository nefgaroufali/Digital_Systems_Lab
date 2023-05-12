`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2022 21:14:17
// Design Name: 
// Module Name: Sec_Counter
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
This module is a counter with 23bits. We use 23bit counter to produce 
a new clock near 1 second. This is because 2^23 = 8388608. The current period 
of the slow clock that we are using is 200ns. So The new clock signal is
200*8388608 ns = 1,6777214 sec.
*/
module Sec_Counter(clk, reset, sec_count);
    
    input clk;
    input reset;
    output sec_count;
    
    reg [22:0] sec_count;
        
    always@(posedge clk or posedge reset)
    begin
        if (reset)
            sec_count <= 23'b0;
        else 
            sec_count <= sec_count + 1;
    end
    
endmodule
