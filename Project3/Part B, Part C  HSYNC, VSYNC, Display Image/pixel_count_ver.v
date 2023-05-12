`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2022 11:42:28
// Design Name: 
// Module Name: pixel_count_ver
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
 This module is a sequential counter to count the vertical pixels.
 This counter is 0 everywhere except from the display time of the horizontal.
 There if the *5 counter has make a "cycle" we increase the pixel by one to move
 to the next pixel vertical. 
*/

module pixel_count_ver(clk, reset, five_count_ver, V_count, V_counter_enable, VPIXEL);

    input clk, reset;
    input [2:0] five_count_ver;
    input [11:0] V_count;
    input V_counter_enable;
    output [6:0] VPIXEL;
    reg [6:0] VPIXEL;
    
    always@(posedge clk or posedge reset)
    begin
        // if reset -> reset the counter
        if(reset)
            VPIXEL <= 7'b0;
        // if vertical in the last value -> reset the counter
        else if(V_count == 12'd520)
            VPIXEL <= 7'b0;
        // if in the display time of the vertical
        // if *5counter == 4 -> vpixel++ else vpixel = vpixel
        else if(V_count < 12'd511 && V_count > 12'd30)
            if(five_count_ver == 3'b100 && V_counter_enable == 1'b1)
                VPIXEL <= VPIXEL + 1;
            else
                VPIXEL <= VPIXEL;
        // everywhere else vpixel = 0;
        else
            VPIXEL <= 7'b0;
        
    end
endmodule
