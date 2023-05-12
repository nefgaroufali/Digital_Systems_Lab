`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2022 17:33:41
// Design Name: 
// Module Name: Digs_Disp
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
This module is responsible for luminating the 4 digits of the board.
In order to do that we need to turn on every digit periodically and 
at the time it is on we need to display its value. So we have 16 states
input. In every state the digits(an0,an1,an2,an3) are turning on or off
and a value (char) is displayed.
*/
module Digs_Disp(count, an0, an1, an2, an3, char);
    
    input [3:0] count;
    output an0, an1, an2, an3;
    output [3:0] char;
    
    reg an0, an1, an2, an3;
    reg [3:0] char;

    // For every of the 16 states of the counter
    // Luminate the corresponding digit and display a specific value
    always@(count)
    begin
        case(count) //Digit A0 - Dispaly value: 0
        4'b0000: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 0;
        end
        
        4'b0001: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 0;
        end
        
        4'b0010: begin
            an0 = 0;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 0;
        end
        
        4'b0011: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 0;
        end
        
        // Digit A1 - Dispaly value: 1
        4'b0100: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 1;
        end
        
        4'b0101: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 1;
        end
        
        4'b0110: begin
            an0 = 1;
            an1 = 0;
            an2 = 1;
            an3 = 1;
            char = 1;
        end
        
        4'b0111: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 1;
        end
        
        // Digit A2 - Display value: 2
        4'b1000: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 2;
        end
        
        4'b1001: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 2;
        end
        
        4'b1010: begin
            an0 = 1;
            an1 = 1;
            an2 = 0;
            an3 = 1;
            char = 2;
        end
        
        4'b1011: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 2;
        end
        
        //Digit A3 - Display value: 3
        4'b1100: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 3;
        end
        
        4'b1101: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 3;
        end
        
        4'b1110: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 0;
            char = 3;
        end
        
        4'b1111: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 3;
        end
        
        // Default case all digits off and display value 5
        default: begin
            an0 = 1;
            an1 = 1;
            an2 = 1;
            an3 = 1;
            char = 5;
        end                     
        endcase
    end
endmodule
