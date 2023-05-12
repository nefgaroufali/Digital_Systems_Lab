`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2022 11:41:00
// Design Name: 
// Module Name: pixel_count_hor
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
 This module is a sequential counter to count the pixels of a horizontal line.
 This counter is 0 everywhere except from the display time of the horizontal.
 There if the *5 counter has make a "cycle" we increase the pixel by one to move
 to the next pixel. 
*/

module pixel_count_hor(clk, reset, HPIXEL, five_count_hor, H_count);
    
    input clk, reset;
    input [4:0] five_count_hor;
    input [11:0] H_count;
    output [6:0] HPIXEL;
    reg [6:0] HPIXEL;
    
    always@(posedge clk or posedge reset)
    begin
        // if reset -> reset counter
        if(reset)
            HPIXEL <= 7'b0;
        // if horizontal in the last value -> reset the counter
        else if(H_count == 12'd3199)
            HPIXEL <= 7'b0;
        // if in the display time of the horizontal
        // if *5counter == 19 -> hpixel++, else hpixel = hpixel
        else if(H_count < 12'd3136 && H_count > 12'd575)
            if(five_count_hor == 5'b10011)
                HPIXEL <= HPIXEL + 1;
            else
                HPIXEL <= HPIXEL;
        // In any other area hpixel = 0;
        else
            HPIXEL <= 7'b0;
        
    end
endmodule
