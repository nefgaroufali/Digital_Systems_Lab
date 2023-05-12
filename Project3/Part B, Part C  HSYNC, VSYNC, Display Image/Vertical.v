`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2022 13:58:06
// Design Name: 
// Module Name: Vertical
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
 This module is an FSM to show us the states of the vertical syncronization and assign
 suitably the VSYNC pulse. The states are the LOW, the BackPorch, the FrontPorch and the
 DisplayTime. To change from a state to another we use the counter we created previously.
 This FSM is MOORE.
*/

module Vertical(clk, reset, V_count, VSYNC, V_counter_enable);
    
    input clk, reset;
    output VSYNC;
    input [11:0] V_count;
    input V_counter_enable;
    //output [1:0] NextStateVer, CurrentStateVer;
    reg VSYNC;
    reg [1:0] NextStateVer, CurrentStateVer;
    parameter Low_V = 2'b00;
    parameter BackPorch_V = 2'b01;
    parameter Display_Time_V = 2'b10;
    parameter FrontPorch_V = 2'b11;
    
    
    // Sequential always
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentStateVer <= Low_V;
        else
            CurrentStateVer <= NextStateVer;
    end
    
    always @ (CurrentStateVer or V_count or V_counter_enable) 
    begin
        case(CurrentStateVer)
 
            Low_V:
            begin
                VSYNC = 1'b0;
                if(V_count == 12'd1 && V_counter_enable == 1'b1)
                    NextStateVer = BackPorch_V;
                else
                    NextStateVer = CurrentStateVer;                                  
            end
            
            
            BackPorch_V:
            begin
                VSYNC = 1'b1;
                if(V_count == 12'd30 && V_counter_enable == 1'b1)
                    NextStateVer = Display_Time_V;
                else
                    NextStateVer = CurrentStateVer;
            end
            
            
            Display_Time_V:
            begin
                VSYNC = 1'b1;
                if(V_count == 12'd510 && V_counter_enable == 1'b1)
                    NextStateVer = FrontPorch_V;
                else
                    NextStateVer = CurrentStateVer;
            end
            
            
            
            FrontPorch_V:
            begin
                VSYNC = 1'b1;
                if(V_count == 12'd520 && V_counter_enable == 1'b1)
                    NextStateVer = Low_V;
                else
                    NextStateVer = CurrentStateVer;
            end
            
        endcase 
    end   
    
    
endmodule
