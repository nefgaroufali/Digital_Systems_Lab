`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2022 10:17:11
// Design Name: 
// Module Name: LEDdecoder
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
This module is a decoder that takes 4bit input and gives 7bit output.
We use 4bit input in order to represent 2^4 = 16 values. The 7bit output
corresponds to the 7 signals that control every LED segment of a digit.
The cathodes ([6:0] LED) are active low according to the manual.
*/

module LEDdecoder(char, LED);
    input [3:0] char;
    output [6:0] LED;
    
    //We use reg type because this output
    //is used in always block (procedural) 
    reg [6:0] LED;

    always@(char)
    begin
        case(char) //abcdefg
            0:  LED = 7'b0000001;
            1:  LED = 7'b1001111;
            2:  LED = 7'b0010010;
            3:  LED = 7'b0000110;
            4:  LED = 7'b1001100;
            5:  LED = 7'b0100100;
            6:  LED = 7'b0100000;
            7:  LED = 7'b0001111;
            8:  LED = 7'b0000000;
            9:  LED = 7'b0000100;
            'hA: LED =7'b0001000;
            'hB: LED =7'b1100000;
            'hC: LED =7'b0110001;
            'hD: LED =7'b1000010;
            'hE: LED =7'b0110000;
            'hF: LED =7'b0111000;
            default: LED = 7'b0000001;
        endcase
    end  
endmodule
