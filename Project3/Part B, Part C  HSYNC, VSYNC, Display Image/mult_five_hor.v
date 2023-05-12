`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2022 11:47:28
// Design Name: 
// Module Name: mult_five_hor
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
 This module is a sequential counter. We use this counter to create *5 pixels than
 that we have from the memory for every horizontal line. However this counter does
 not count till 5. Every bit from the 640 should be displayed for 40ns. So the counter
 counts till 19 (5*4).
*/

module mult_five_hor(clk, reset, five_count_hor, H_count);

    input clk, reset;
    input [11:0] H_count;
    output [4:0] five_count_hor;
    reg [4:0] five_count_hor;
    
    
    
    always@(posedge clk or posedge reset)
    begin
        // if reset or if we are in the display time of the horizontal -> reset
        if(reset || (H_count == 12'd575))
            five_count_hor <= 5'b0;
        // if counter == 19 -> reset in the next cycle
        else if(five_count_hor == 5'b10011)
            five_count_hor <= 5'b0;
        // else count++
        else
            five_count_hor <= five_count_hor + 1;
    end
    
endmodule
