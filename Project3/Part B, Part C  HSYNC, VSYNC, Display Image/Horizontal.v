`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2022 13:57:39
// Design Name: 
// Module Name: Horizontal
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
 This module is an FSM to show us the states of the horizontal syncronization and assign
 suitably the HSYNC pulse. The states are the LOW, the BackPorch, the FrontPorch and the
 DisplayTime. To change from a state to another we use the counter we created previously.
 This FSM is MOORE. 
*/
module Horizontal(clk, reset, H_count, HSYNC);
    
    input clk, reset;
    output HSYNC;
    input [11:0] H_count;
    //output [1:0] NextStateHor, CurrentStateHor;
    reg HSYNC;
    reg [1:0] NextStateHor, CurrentStateHor;
    parameter Low_H = 2'b00;
    parameter BackPorch_H = 2'b01;
    parameter Display_Time_H = 2'b10;
    parameter FrontPorch_H = 2'b11;
    
    
    // Sequential always
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentStateHor <= Low_H;
        else
            CurrentStateHor <= NextStateHor;
    end
    
    
    // Combinational always
    always @ (CurrentStateHor or H_count) 
    begin
        case(CurrentStateHor)
 
            Low_H:
            begin
                HSYNC = 1'b0;
                if(H_count == 12'd383)
                    NextStateHor = BackPorch_H;
                else
                    NextStateHor = CurrentStateHor;                                  
            end
            
            
            BackPorch_H:
            begin
                HSYNC = 1'b1;
                if(H_count == 12'd575)
                    NextStateHor = Display_Time_H;
                else
                    NextStateHor = CurrentStateHor;
            end
            
            
            Display_Time_H:
            begin
                HSYNC = 1'b1;
                if(H_count == 12'd3135)
                    NextStateHor = FrontPorch_H;
                else
                    NextStateHor = CurrentStateHor;
            end
            
            
            
            FrontPorch_H:
            begin
                HSYNC = 1'b1;
                if(H_count == 12'd3199)
                    NextStateHor = Low_H;
                else
                    NextStateHor = CurrentStateHor;
            end
            
        endcase 
    end   
endmodule
