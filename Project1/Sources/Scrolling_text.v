`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2022 19:10:54
// Design Name: 
// Module Name: Scrolling_text
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
This module is probably a MUX with a 4bit input and 4 4bit outputs.
In other words for every of 16 states of the count_en (the counter with button),
this module assignes the appropriate displayed values for the 4 digits. 
*/

module Scrolling_text(count_en, message, char_A3, char_A2, char_A1, char_A0);
    input [63:0] message;
    input [3:0] count_en;
    output [3:0] char_A3, char_A2, char_A1, char_A0;
    
    reg [3:0] char_A3, char_A2, char_A1, char_A0;

    always@(count_en or message)
    begin
        case(count_en) //state 1 - output: 0 1 2 3
        4'b0000: begin
            char_A3 = message[3:0];
            char_A2 = message[7:4];
            char_A1 = message[11:8];
            char_A0 = message[15:12];
        end
          
        //state 2 - output: 1 2 3 4
        4'b0001: begin
            char_A3 = message[7:4];
            char_A2 = message[11:8];
            char_A1 = message[15:12];
            char_A0 = message[19:16];
        end
        
        //state 3 - output: 2 3 4 5  
        4'b0010: begin
            char_A3 = message[11:8];
            char_A2 = message[15:12];
            char_A1 = message[19:16];
            char_A0 = message[23:20];
        end
        
        //state 4 - output: 3 4 5 6
        4'b0011: begin
            char_A3 = message[15:12];
            char_A2 = message[19:16];
            char_A1 = message[23:20];
            char_A0 = message[27:24];
        end
        
        //state 5 - output: 4 5 6 7
        4'b0100: begin
            char_A3 = message[19:16];
            char_A2 = message[23:20];
            char_A1 = message[27:24];
            char_A0 = message[31:28];
        end
        
        //state 6 - output: 5 6 7 8
        4'b0101: begin
            char_A3 = message[23:20];
            char_A2 = message[27:24];
            char_A1 = message[31:28];
            char_A0 = message[35:32];
        end
        
        //state 7 - output: 6 7 8 9   
        4'b0110: begin
            char_A3 = message[27:24];
            char_A2 = message[31:28];
            char_A1 = message[35:32];
            char_A0 = message[39:36];
        end
        
        //state 8 - output: 7 8 9 A
        4'b0111: begin
            char_A3 = message[31:28];
            char_A2 = message[35:32];
            char_A1 = message[39:36];
            char_A0 = message[43:40];
        end
        
        //state 9 - output: 8 9 A b
        4'b1000: begin
            char_A3 = message[35:32];
            char_A2 = message[39:36];
            char_A1 = message[43:40];
            char_A0 = message[47:44];
        end
        
        //state 10 - output: 9 A b C
        4'b1001: begin
            char_A3 = message[39:36];
            char_A2 = message[43:40];
            char_A1 = message[47:44];
            char_A0 = message[51:48];
        end
        
        //state 11 - output: A b C d  
        4'b1010: begin
            char_A3 = message[43:40];
            char_A2 = message[47:44];
            char_A1 = message[51:48];
            char_A0 = message[55:52];
        end
        
        //state 12 - output: b C d E
        4'b1011: begin
            char_A3 = message[47:44];
            char_A2 = message[51:48];
            char_A1 = message[55:52];
            char_A0 = message[59:56];
        end
        
        //state 13 - output: C d E F
        4'b1100: begin
            char_A3 = message[51:48];
            char_A2 = message[55:52];
            char_A1 = message[59:56];
            char_A0 = message[63:60];
        end
        
        //state 14 - output: d E F 0
        4'b1101: begin
            char_A3 = message[55:52];
            char_A2 = message[59:56];
            char_A1 = message[63:60];
            char_A0 = message[3:0];
        end
        
        //state 15 - output: E F 0 1
        4'b1110: begin
            char_A3 = message[59:56];
            char_A2 = message[63:60];
            char_A1 = message[3:0];
            char_A0 = message[7:4];
        end
        
        //state 16 - output: F 0 1 2
        4'b1111: begin
            char_A3 = message[63:60];
            char_A2 = message[3:0];
            char_A1 = message[7:4];
            char_A0 = message[11:8];
        end
        
        // default state - output: F F F F
        default: begin
            char_A3 = message[63:60];
            char_A2 = message[63:60];
            char_A1 = message[63:60];
            char_A0 = message[63:60];
        end                     
        endcase
    end
    
endmodule
