`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 15:41:13
// Design Name: 
// Module Name: variable_assigns
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


module variable_assigns(clk, reset, Rx_DATA, next_RxDATA, parity_error, Rx_PERROR, framing_error, valid, Rx_FERROR, Rx_VALID);
    
    input clk, reset, Rx_PERROR, Rx_FERROR, Rx_VALID;
    input [7:0] next_RxDATA;
    output [7:0] Rx_DATA;
    output parity_error;
    output framing_error;
    output valid;
    //output read_enable;
    //input read_enable_next;
    //reg read_enable;
    reg parity_error;
    reg framing_error;
    reg valid;
    reg [7:0] Rx_DATA;
    
    
    
    // Flip Flop to give the Rx_DATA their
    // previous values without making a latch
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            Rx_DATA <= 8'b0;
        else
            Rx_DATA <= next_RxDATA;
    end
    
    
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            parity_error <= 1'b0;
        else
            parity_error <= Rx_PERROR;
    end
    
    
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            framing_error <= 1'b0;
        else
            framing_error <= Rx_FERROR;
    end   


    always @(posedge clk or posedge reset)
    begin
        if(reset == 1'b1)
            valid <= 1'b0;
        else
            valid <= Rx_VALID;
    end   

endmodule
