`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2023 17:28:40
// Design Name: 
// Module Name: Recording
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
This module is an FSM for Part A, in other words the Recording. It is a MOORE FSM
The outputs do not depend on the input. The FSM has 2 states. The IDLE state and the
Rec state. When the record button is pressed we go to the Rec state. In the Rec state
the write enable is f and the data given to the memory are the data from the deserializer.
*/
module Recording(clk, reset, recordBtnEN, write_enable, data_in, packets, thirty_two_count, shifted_micData);
    
    input clk, reset, recordBtnEN;
    input [9:0] packets;
    input [4:0] thirty_two_count;
    input [31:0] shifted_micData;
    output [3:0] write_enable;
    //output [15:0] address;
    output [31:0] data_in;
    
    
    reg NextStateRec, CurrentStateRec;
    reg [31:0] data_in;
    reg [3:0] write_enable;
    parameter IDLE = 1'b0;
    parameter Rec = 1'b1;
    
    
    // Sequential always
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentStateRec <= IDLE;
        else
            CurrentStateRec <= NextStateRec;
    end
    
    
    // Combinational always
    always @ (CurrentStateRec or packets or thirty_two_count or shifted_micData or recordBtnEN) 
    begin
        case(CurrentStateRec)
 
            IDLE:
            begin
                data_in = 32'b0;
                write_enable = 4'b0;
                if(recordBtnEN)
                    NextStateRec = Rec;
                else
                    NextStateRec = CurrentStateRec;                                  
            end
            
            
            Rec:
            begin
                data_in = shifted_micData;
                write_enable = 4'b1111;
                if(packets == 10'd936 && thirty_two_count == 5'd31)
                    NextStateRec = IDLE;
                else
                    NextStateRec = CurrentStateRec;
            end
            
        endcase 
    end  
    
endmodule
