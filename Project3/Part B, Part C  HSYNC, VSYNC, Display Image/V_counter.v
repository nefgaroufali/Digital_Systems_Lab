`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2022 11:19:32
// Design Name: 
// Module Name: V_counter
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
 This module is a sequential system which is a counter for the vertical synchronization. 
 To create this every time we receive an enable of the Hcount that shows that a line has passed
 we increase the vcount by 1.  
 Vcount range: 0 - 520
*/

module V_counter(clk, reset, V_counter_enable, V_count);
    
    input clk, reset, V_counter_enable;
    output [11:0] V_count;
    reg [11:0] V_count;
    
    always@(posedge clk or posedge reset)
    begin
        // if reset or if the Vcount is at the last value -> reset
        if(reset || (V_count == 12'd520 && V_counter_enable == 1'b1))
            V_count <= 12'b0;
        // if vcounter is less than the last value -> vcount++
        else if(V_counter_enable == 1'b1 && V_count <= 12'd520)
            V_count <= V_count + 1;
        else
            V_count <= V_count;
    end
        
        
        
        
endmodule
