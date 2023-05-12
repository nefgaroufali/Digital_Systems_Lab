`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2022 18:09:46
// Design Name: 
// Module Name: uart_transmitter
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
This module is about a uart transmitter. The transmitter has 4 inputs except from clock and reset.
Baud_select input is used to select a baud_rate for the transmitter. The Tx_EN input shows us whether
the transmitter is active or not. Next we have the Tx_DATA input which is the 8bit data we want to transmit.
Finally Tx_WR is a pulse input. When it this signal is 1 the transmitter starts transmitting the data.
The outputs of the module are Tx_BUSY and TxD. TxD is the output of the transmitter that connects to the
receiver. This 1bit output sends bit by bit the data from the transmitter to the receiver. Inside the module
there is a moore state machine. We have as many states as the number of bits of the message. So we have one 
state for the initial state and  10 more stetes (start_bit, first_bit, ... eighth_bit, parity, stop_bit). 
Each time the counter takes the appropriate value that shows we are in the next bit, we move to the next
state. Every state has a specific output. That is why this state machine is moore.
*/
module uart_transmitter(reset, clk, Tx_DATA, baud_select, Tx_WR, Tx_EN, TxD, Tx_BUSY);
    input reset, clk;
    input [7:0] Tx_DATA;
    input [2:0] baud_select;
    input Tx_EN;
    input Tx_WR;
    output TxD;
    output Tx_BUSY;
    wire Tx_sample_ENABLE;
    reg [3:0] CurrentState;
    reg [3:0] NextState;
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
    reg Tx_BUSY;
    reg TxD;
    wire [3:0] counter;
    wire [3:0] bits;
    wire parity;

    
    baud_controller baud_controller_tx_inst(reset, clk, baud_select, Tx_sample_ENABLE);
    bits_counter bitcount (clk, reset, counter, Tx_WR, Tx_sample_ENABLE, bits);
    counter count(clk, reset, Tx_WR, Tx_sample_ENABLE, counter);
    parity_maker prt(Tx_DATA, parity);

    
    // Sequential always
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentState <= IDLE;
        else
            CurrentState <= NextState;
    end
    

    // Combinational always
    // Here we have all states, the outputs for every state as well as the conditions that moves us to the next state.
    always @ (CurrentState or Tx_WR or Tx_EN or bits or Tx_DATA or parity) 
    begin
        case(CurrentState)
        
            // state IDLE: In this state the transmitter is not transmitting data
            // Tx_BUSY is 0 and TxD is 1 so that the receiver will understand the startbit
            // when it comes. To move to the next state Tx_EN must be high
            // meaning that the receiver is active and Tx_WR which is the signal for the transmitter
            // to transmit must be also high.  
            IDLE:
            begin
                Tx_BUSY = 1'b0;
                TxD = 1'b1;
                if(Tx_WR && Tx_EN == 1'b1)
                    NextState = start_bit;
                else
                    NextState = CurrentState;                                  
            end
            
            
            // state start_bit: In this state we have started the transmission so Tx_BUSY is 1.
            // The output is 0 since we are transmitting the start bit which is by default 0.
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            start_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = 1'b0;
                if(bits == 4'b0001)
                    NextState = first_bit;
                else
                    NextState = CurrentState;
            end
            
            
            // state first_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[7] since we are transmitting
            // the first bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            first_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[7];
                if(bits == 4'b0010)
                    NextState = second_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state second_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[6] since we are transmitting
            // the second bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            second_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[6];
                if(bits == 4'b0011)
                    NextState = third_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state third_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[5] since we are transmitting
            // the third bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            third_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[5];
                if(bits == 4'b0100)
                    NextState = fourth_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state fourth_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[4] since we are transmitting
            // the fourth bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            fourth_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[4];
                if(bits == 4'b0101)
                    NextState = fifth_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state fifth_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[3] since we are transmitting
            // the fifth bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            fifth_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[3];
                if(bits == 4'b0110)
                    NextState = sixth_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state sixth_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[2] since we are transmitting
            // the sixth bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            sixth_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[2];
                if(bits == 4'b0111)
                    NextState = seventh_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state seventh_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[1] since we are transmitting
            // the seventh bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            seventh_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[1];
                if(bits == 4'b1000)
                    NextState = eighth_bit;
                else
                    NextState = CurrentState;
            end
            
            
            
            // state eighth_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to Tx_DATA[0] since we are transmitting
            // the eighth bit and we don't know in advance its value (0 or 1).
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            eighth_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = Tx_DATA[0];
                if(bits == 4'b1001)
                    NextState = parity_bit;
                else
                    NextState = CurrentState;
            end
            
            
            // state parity_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is constantly equal to parity which is the outcome from the module parity_maker
            // and is either 0 or 1 depending on and whether there is even or odd number of 1s respectively
            // in the message we are transmitting.
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state.
            parity_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = parity;
                if(bits == 4'b1010)
                    NextState = stop_bit;
                else
                    NextState = CurrentState;
            end
            
            
            // state stop_bit: In this state the transmission is on so Tx_BUSY is 1.
            // The output is 1 because we are transimtting the stop bit which is always 1.
            // After 16 Tx_sample_ENABLES or after the time of this bit has passed we move to the
            // next state which is the IDLE(initial) state.
            stop_bit:
            begin
                Tx_BUSY = 1'b1;
                TxD = 1;
                if(bits == 4'b1011)
                    NextState = IDLE;
                else
                    NextState = CurrentState;
            end
            
            default
            begin
                Tx_BUSY = 1'b0;
                TxD = 1'b1;        
                NextState = IDLE;
            end
        endcase
        
    end
endmodule
