`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2023 21:35:45
// Design Name: 
// Module Name: PlayBack
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
This module is an FSM for the Part B. This is a MEALY FSM. It has 3 states. The
first state is the IDLE state. Once the Play bitton is pressed we go to the next state
the Preplay. In this state we lose a packet in order to fetch the data from the 
first packet from the memory. Once we have done that and we are in the last bit of the
this packet we move to the next state. The state Play. There the output of the FSM is 
the data from the serializer. 
*/
module PlayBack(clk, reset, playbackBtnEN, audDataPWM, packets, thirty_two_count, Serial_out, prepacket, audEnPWM, big_count);
    input clk, reset, playbackBtnEN;
    input [8:0] big_count;
    input [9:0] packets;
    input [4:0] thirty_two_count;
    input Serial_out;
    output audEnPWM;
    output prepacket;
    //output [15:0] address;
    output audDataPWM;
    
    
    reg [1:0] NextStatePlay, CurrentStatePlay;
    reg audDataPWM;
    reg audEnPWM;
    reg prepacket;
    parameter IDLE = 2'b0;
    parameter prePlay = 2'b01;
    parameter Play = 2'b10;
    
    
    // Sequential always
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentStatePlay <= IDLE;
        else
            CurrentStatePlay <= NextStatePlay;
    end
    
    
    // Combinational always
    always @ (CurrentStatePlay or packets or thirty_two_count or Serial_out or playbackBtnEN or big_count) 
    begin
        case(CurrentStatePlay)
 
            IDLE:
            begin
                
                if(playbackBtnEN)
                begin
                    prepacket = 0;
                    audDataPWM = 32'b0;
                    audEnPWM = 0;
                    NextStatePlay = prePlay;
                end
                else
                begin
                    prepacket = 0;
                    audEnPWM = 0;
                    audDataPWM = 32'b0;
                    NextStatePlay = CurrentStatePlay;
                end                                  
            end
            
            prePlay:
            begin
                
                if(packets == 10'd0 && thirty_two_count == 5'd31)
                begin
                    prepacket = 1;
                    audEnPWM = 0;
                    audDataPWM = 32'b0;
                    NextStatePlay = Play;
                end
                else
                begin
                    prepacket = 0;
                    audEnPWM = 0;
                    audDataPWM = 32'b0;
                    NextStatePlay = CurrentStatePlay;
                end                                  
            end
            
            Play:
            begin
                
                if(packets == 10'd936 && thirty_two_count == 5'd31 && big_count == 9'd399)
                begin
                    prepacket = 0;
                    audEnPWM = 0;
                    audDataPWM = 32'd0;
                    NextStatePlay = IDLE;
                end
                else
                begin
                    prepacket = 0;
                    audEnPWM = 1;
                    audDataPWM = Serial_out;
                    NextStatePlay = CurrentStatePlay;
                end
            end
            
            default:
            begin
                prepacket = 0;
                audEnPWM = 0;
                audDataPWM = 32'd0;
                NextStatePlay = IDLE;
            end
            
        endcase 
    end  

endmodule
