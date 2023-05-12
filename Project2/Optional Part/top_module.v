`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 17:37:38
// Design Name: 
// Module Name: top_module
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


module top_module(reset, clk,  an3, an2, an1, an0, a, b, c, d, e, f, g, dp);

    input reset, clk;
    output an3, an2, an1, an0;
    output a, b, c, d, e, f, g, dp;
    //assign dp=1;
    wire [3:0] count;
    wire new_clk;
    wire [3:0] char;
    wire Tx_EN = 1'b1;
    wire Rx_EN = 1'b1;
    reg [7:0] Tx_DATA;
    wire [2:0] baud_select = 3'b010;
    wire TxD;
    wire Tx_BUSY;
    wire Rx_VALID, Rx_PERROR, Rx_FERROR;
    wire [7:0] Rx_DATA;
    wire TxD_sync;
    wire RxD;
    reg [3:0] CurrentState;
    reg [3:0] NextState;
    //reg Tx_BUSY;
    parameter IDLE = 4'b0000;
    parameter first = 4'b0001;
    parameter second = 4'b0010;
    parameter third = 4'b0011;
    parameter fourth = 4'b0100;
    reg Tx_WR;
    wire [7:0] new_RxDATA;
    wire [25:0] counter;
    
    
    uart_top uart (reset, clk, Tx_DATA, Tx_WR, Tx_EN, Tx_BUSY, Rx_DATA, baud_select, Rx_EN, Rx_FERROR, Rx_PERROR, Rx_VALID);
    variable_init newrx(clk, Rx_DATA, new_RxDATA, Rx_VALID);
    FourDigitLedDRIVER leds (reset, clk, an3, an2, an1, an0, a, b, c, d, e, f, g, dp, new_RxDATA);
    sec_counter sec(clk, reset, counter, Tx_WR);
    

    // Sequential always
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            CurrentState <= IDLE;
        else
            CurrentState <= NextState;
    end
    
    
    always @ (CurrentState or Tx_BUSY) 
    begin
        case(CurrentState)
            IDLE:
            begin
                Tx_DATA = 8'b0;
                if(Tx_BUSY == 1'b0)
                begin
                    Tx_WR = 1'b1;
                    NextState = first;
                end
                else
                begin
                    Tx_WR = 1'b0;
                    NextState = CurrentState;
                end                                  
            end
            
            
            // state first: In this state we want to transmit the first message
            // so Tx_DATA is 10101010
            first:
            begin
                Tx_DATA = 8'b10101010;
                if(Tx_BUSY == 1'b0 && counter == 26'b0)
                begin
                    Tx_WR = 1'b1;
                    NextState = second;
                end
                else
                begin
                    Tx_WR = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            
            // state second: In this state we want to transmit the second message
            // so Tx_DATA is 01010101
            second:
            begin
                Tx_DATA = 8'b01010101;
                if(Tx_BUSY == 1'b0 && counter == 26'b0)
                begin
                    Tx_WR = 1'b1;
                    NextState = third;
                end
                else
                begin
                    Tx_WR = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            
            
            // state third: In this state we want to transmit the third message
            // so Tx_DATA is 11001100
            third:
            begin
            Tx_DATA = 8'b11001100;
            if(Tx_BUSY == 1'b0  && counter == 26'b0)
                begin
                    Tx_WR = 1'b1;
                    NextState = fourth;
                end
                else
                begin
                    Tx_WR = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            
            
            // state fourth: In this state we want to transmit the fourth message
            // so Tx_DATA is 10001001
            fourth:
            begin
            Tx_DATA = 8'b10001001;
            if(Tx_BUSY == 1'b0  && counter == 26'b0)
                begin
                    Tx_WR = 1'b1;
                    NextState = IDLE;
                end
                else
                begin
                    Tx_WR = 1'b0;
                    NextState = CurrentState;
                end
            end
            
            
            default:
            begin
                Tx_WR = 1'b0;
                Tx_DATA = 8'b11111111;
                NextState = IDLE;
            end
        endcase
        end
        
endmodule