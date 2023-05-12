`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2022 14:06:48
// Design Name: 
// Module Name: mult_five_ver
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
 This module is a sequential counter. We use this counter to create *5 lines than
 that we have from the memory. So this counter counts till 4 (0 - 4) = 5.
*/

module mult_five_ver(clk, reset, five_count_ver, V_counter_enable, V_count);
    input clk, reset;
    output [2:0] five_count_ver;
    input  V_counter_enable;
    input [11:0] V_count;
    reg [2:0] five_count_ver;
    
    
    always@(posedge clk or posedge reset)
    begin
        // if reset or if in the vertical display time -> reset the counter
        if(reset || (V_count == 12'd30 && V_counter_enable == 1'b1))
            five_count_ver <= 3'b0;
        //  if counter at the final value -> reset
        else if(five_count_ver == 3'b100 && V_counter_enable == 1'b1)
            five_count_ver <= 3'b0;
        // else counter++
        else if(V_counter_enable == 1'b1)
            five_count_ver <= five_count_ver + 1;
        // else counter = counter
        else
            five_count_ver <= five_count_ver;
    end
endmodule
