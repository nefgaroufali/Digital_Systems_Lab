`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 14:49:38
// Design Name: 
// Module Name: uart_receiver
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
This module describes the receiver. The receiver has 5 inputs. Except from reset clock and baud_select, the Rx_EN input
whenever 1 indicates that the receiver is active. The RxD input is connected with the transmitter and provides the data
the receiver is receiving. This data will appear in the Rx_DATA output. The other outputs (Rx_FERROR, Rx_PERROR, Rx_VALID)
are signals that show the situation of the receiver. Specifically Rx_PERROR is set to 1, when  a framing error has occured.
Rx_PERROR is set to 1 when a parity error has occured. Whenever these signals are 1 Rx_VALID is 0 because the data because
the data has not been transmitted proprerly. We initially instantiate the baud_controller module in order to create the 
Rx_sample_ENABLE, that we want to use for other modules like the counter. Inside the module there is a mealy state machine. 
We have as many states as the number of bits of the message. So we have one state for the initial state and  10 more stetes
(start_bit, first_bit, ... eighth_bit, parity, stop_bit). Each time the counter takes the appropriate value that shows we are 
in the middle of the bit, the output changes and we move to the next state.
*/
module uart_receiver(reset, clk, Rx_DATA, baud_select, Rx_EN, RxD, Rx_FERROR, Rx_PERROR, Rx_VALID);
    
    input reset, clk;
    input [2:0] baud_select;
    input Rx_EN;
    input RxD;
    output [7:0] Rx_DATA;
    output Rx_FERROR; // Framing Error //
    output Rx_PERROR; // Parity Error //
    output Rx_VALID; // Rx_DATA is Valid //
    reg Rx_FERROR;
    reg Rx_PERROR;
    reg Rx_VALID;
    wire [7:0] Rx_DATA;
    wire Rx_sample_ENABLE;
    reg [3:0] CurrentState;
    reg [3:0] NextState;
    
    // define the states
    parameter IDLE = 4'b0000;
    parameter start_bit = 4'b0001;
    parameter first_bit = 4'b0010;
    parameter second_bit = 4'b0011;
    parameter third_bit = 4'b0100;
    parameter fourth_bit = 4'b0101;
    parameter fifth_bit = 4'b0110;
    parameter sixth_bit = 4'b0111;
    parameter seventh_bit = 4'b1000;
    parameter eighth_bit = 4'b1001;
    parameter parity_bit = 4'b1010;
    parameter stop_bit = 4'b1011;
    
    reg parity;
    wire r_parity;
    wire RxD;
    reg [7:0] next_RxDATA;
    wire parity_error;
    wire [7:0] bigcounter;
    reg read_enable;
    wire framing_error;
    wire valid;
    
    
    // Other module instantiations
    // Baud_controller - To get the Rx_sample_ENABLE
    baud_controller baud_controller_tx_inst(reset, clk, baud_select, Rx_sample_ENABLE);
    // Counter that counts 16(Rx_sample_ENABLE * 11 states) - 1 (we start countung from 0) 
    bigcounter bgcnt(clk, reset, Rx_sample_ENABLE, read_enable, bigcounter);
    // Module that computes the parity value from the received data
    parity_maker prt(Rx_DATA, r_parity);
    //
    variable_assigns vba(clk, reset, Rx_DATA, next_RxDATA, parity_error, Rx_PERROR, framing_error, valid, Rx_FERROR, Rx_VALID);

    
    // Sequential always
    // to change to the nextState at every clock
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentState <= IDLE;
        else
            CurrentState <= NextState;
    end
    
    

    // Combinational always
    // Here we have all states, the conditions that moves us to the next state as well as the outputs
    always @ (CurrentState or Rx_EN or RxD or read_enable or Rx_sample_ENABLE or RxD or bigcounter or parity or r_parity or Rx_DATA or parity_error or framing_error or valid) 
    begin
        case(CurrentState)
            
            // state IDLE: In this state the receiver is not receiving data
            // Every output is 0. To move to the next state Rx_EN must be high
            // meaning that the receiver is active and RxD must be low which means
            // we received the start bit.
            IDLE:
            begin
                if(RxD == 1'b0 && Rx_EN == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_VALID = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    next_RxDATA[7:0] = 8'b0;
                    parity = 1'b0;
                    NextState = start_bit;
                end
                else
                begin
                    read_enable = 1'b1;
                    Rx_VALID = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    next_RxDATA[7:0] = 8'b0;
                    parity = 1'b0;
                    NextState = CurrentState;
                end                                  
            end
            
            
            // state start_bit: In this state we wait 24 Rx_sample_ENABLES to sample the 1st bit. 
            // (16 which is the bit period + 8 to move to the middle of the next bit period.
            //  We do this because the sampled value in the middle of the bit will be more secure.
            //  Since we received the 1st bit we directly move to the next state.
            start_bit:
            begin       
                if(bigcounter == 8'b00011000 && Rx_sample_ENABLE == 1'b1)
                begin
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    read_enable = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[6:0] = Rx_DATA[6:0];
                    next_RxDATA[7] = RxD;
                    NextState = first_bit;
                end    
                else
                begin
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    read_enable = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[6:0] = Rx_DATA[6:0];
                    next_RxDATA[7] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state first_bit: This state starts from the middle of the 1st bit
            // and ends when we are in the middle of the 2nd bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 2nd bit.
            first_bit:
            begin
                if(bigcounter == 8'b00101000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7] = Rx_DATA[7];
                    next_RxDATA[5:0] = Rx_DATA[5:0];
                    next_RxDATA[6] = RxD;
                    NextState = second_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7] = Rx_DATA[7];
                    next_RxDATA[5:0] = Rx_DATA[5:0];
                    next_RxDATA[6] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state second_bit: This state starts from the middle of the 2nd bit
            // and ends when we are in the middle of the 3rd bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 3rd bit.
            second_bit:
            begin
                if(bigcounter == 8'b00111000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:6] = Rx_DATA[7:6];
                    next_RxDATA[4:0] = Rx_DATA[4:0];
                    next_RxDATA[5] = RxD;
                    NextState = third_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:6] = Rx_DATA[7:6];
                    next_RxDATA[4:0] = Rx_DATA[4:0];
                    next_RxDATA[5] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state third_bit: This state starts from the middle of the 3rd bit
            // and ends when we are in the middle of the 4th bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 4th bit.
            third_bit:
            begin
                if(bigcounter == 8'b01001000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:5] = Rx_DATA[7:5];
                    next_RxDATA[3:0] = Rx_DATA[3:0];
                    next_RxDATA[4] = RxD;
                    NextState = fourth_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:5] = Rx_DATA[7:5];
                    next_RxDATA[3:0] = Rx_DATA[3:0];
                    next_RxDATA[4] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state fourth_bit: This state starts from the middle of the 4th bit
            // and ends when we are in the middle of the 5th bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 5th bit.
            fourth_bit:
            begin
                if(bigcounter == 8'b01011000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:4] = Rx_DATA[7:4];
                    next_RxDATA[2:0] = Rx_DATA[2:0];
                    next_RxDATA[3] = RxD;
                    NextState = fifth_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:4] = Rx_DATA[7:4];
                    next_RxDATA[2:0] = Rx_DATA[2:0];
                    next_RxDATA[3] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state fifth_bit: This state starts from the middle of the 5th bit
            // and ends when we are in the middle of the 6th bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 6th bit.
            fifth_bit:
            begin
                if(bigcounter == 8'b01101000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:3] = Rx_DATA[7:3];
                    next_RxDATA[1:0] = Rx_DATA[1:0];
                    next_RxDATA[2] = RxD;
                    NextState = sixth_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:3] = Rx_DATA[7:3];
                    next_RxDATA[1:0] = Rx_DATA[1:0];
                    next_RxDATA[2] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state sixth_bit: This state starts from the middle of the 6th bit
            // and ends when we are in the middle of the 7th bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 7th bit.
            sixth_bit:
            begin
                if(bigcounter == 8'b01111000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:2] = Rx_DATA[7:2];
                    next_RxDATA[0] = Rx_DATA[0];
                    next_RxDATA[1] = RxD;
                    NextState = seventh_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:2] = Rx_DATA[7:2];
                    next_RxDATA[0] = Rx_DATA[0];
                    next_RxDATA[1] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state seventh_bit: This state starts from the middle of the 7th bit
            // and ends when we are in the middle of the 8th bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the 8th bit.
            seventh_bit:
            begin
                
                if(bigcounter == 8'b10001000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:1] = Rx_DATA[7:1];
                    next_RxDATA[0] = RxD;
                    NextState = eighth_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    parity = 1'b0;
                    next_RxDATA[7:1] = Rx_DATA[7:1];
                    next_RxDATA[0] = Rx_DATA;
                    NextState = CurrentState;
                end
            end
            
            
            // state eighth_bit: This state starts from the middle of the 8th bit
            // and ends when we are in the middle of the parity bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we sample the parity bit.
            eighth_bit:
            begin
                
                // At the time we receive the parity bit we check if that is equal
                // with r_parity which is the parity we compute from the data we received
                // If these 2 are not equal we set Rx_PERROR = 1'b1
                if(bigcounter == 8'b10011000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    next_RxDATA = Rx_DATA;
                    parity = RxD;
                    if(r_parity != parity)
                        Rx_PERROR = 1'b1;
                    else Rx_PERROR = 1'b0;
                    NextState = parity_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_FERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    Rx_PERROR = 1'b0;
                    next_RxDATA = Rx_DATA;
                    parity = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            
            // state parity_bit: This state starts from the middle of the parity bit
            // and ends when we are in the middle of the stop bit. This time we 
            // count (and wait) 16 more Rx_sample_ENABLES (bit period) to go to the
            // middle of the next bit. At the time we get there we move to the stop bit state.
            parity_bit:
            begin
                if(bigcounter == 8'b10101000 && Rx_sample_ENABLE == 1'b1)
                begin
                    read_enable = 1'b0;
                    Rx_PERROR = parity_error;
                    //Rx_FERROR = framing_error;
                    //Rx_VALID = valid;
                    if(RxD == 1'b0)
                        Rx_FERROR = 1'b1;
                    else
                        Rx_FERROR = 1'b0;
                    if(Rx_PERROR == 1'b1 || Rx_FERROR == 1'b1)
                        Rx_VALID = 1'b0;
                    else
                        Rx_VALID = 1'b1;
                    
                    next_RxDATA = Rx_DATA;
                    parity = 1'b0;
                    NextState = stop_bit;
                end
                else
                begin
                    read_enable = 1'b0;
                    Rx_PERROR = parity_error;
                    Rx_FERROR = 1'b0;
                    Rx_VALID = 1'b0;
                    next_RxDATA = Rx_DATA;
                    parity = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            
            // state stop_bit: In this state we sample the stop bit and if it is different than 1
            // we set Rx_FERROR 1'b1 to indicate a framing error. As the receiving of the data stops
            // with the stop bit we have to check if everything was ok. Then we set Rx_VALID either to 1 or 0.
            stop_bit:
            begin
                if(bigcounter == 8'b10101111 && Rx_sample_ENABLE == 1'b1)
                begin
                    Rx_VALID = 1'b0;
                    next_RxDATA[7:0] = 8'b0;
                    Rx_FERROR = 1'b0;
                    Rx_PERROR = 1'b0;
                    read_enable = 1'b1;
                    parity = 1'b0;
                    NextState = IDLE;
                end
                else
                begin
                    Rx_VALID = valid;
                    next_RxDATA = Rx_DATA;
                    Rx_FERROR = framing_error;
                    Rx_PERROR = parity_error;
                    read_enable = 1'b0;
                    parity = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            default
            begin
                read_enable = 1'b1;
                Rx_FERROR = 1'b0;
                Rx_PERROR = 1'b0;
                next_RxDATA = Rx_DATA;
                NextState = IDLE;
                Rx_VALID = 1'b0;
                parity = 1'b0;
            end
        endcase 
    end
    
    
    
endmodule
