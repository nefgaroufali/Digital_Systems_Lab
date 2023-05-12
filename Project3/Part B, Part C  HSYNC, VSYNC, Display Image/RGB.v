`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2022 15:32:17
// Design Name: 
// Module Name: RGB
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
 This module takes the colours of the pixel and the counters for the vertical and horizontal
 if we are in the display of both the counters we assign the VGA colours to the values of the colours. 
*/
module RGB(clk, reset, H_count, V_count, red_col, green_col, blue_col, VGA_RED, VGA_GREEN, VGA_BLUE);
    input clk, reset;
    input [11:0] H_count;
    input [11:0] V_count;
    input red_col, green_col, blue_col;
    output [3:0] VGA_RED, VGA_GREEN, VGA_BLUE; 
    reg [3:0] VGA_RED, VGA_GREEN, VGA_BLUE;
    
    always @ (posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            VGA_RED <= 4'b0;
            VGA_GREEN <= 4'b0;
            VGA_BLUE <= 4'b0;
        end
        else begin
            if (((H_count >= 12'd575) && (H_count < 12'd3135)) && ((V_count > 12'd30) && (V_count < 12'd511))) begin
                VGA_RED <= {red_col,red_col,red_col,red_col};
                VGA_GREEN <= {green_col,green_col,green_col,green_col};
                VGA_BLUE <= {blue_col,blue_col,blue_col,blue_col};
            end
            else begin
                VGA_RED <= 4'b0;
                VGA_GREEN <= 4'b0;
                VGA_BLUE <= 4'b0;
            end
        end
    end
endmodule
