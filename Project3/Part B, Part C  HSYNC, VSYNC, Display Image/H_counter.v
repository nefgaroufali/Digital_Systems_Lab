`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2022 11:19:08
// Design Name: 
// Module Name: H_counter
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
 This module is a sequential system which is a counter for the horizontal synchronization. 
 To create this we take the duration of the H signal and we convert it to ns. Then we divide
 with the 10ns clock of the FPGA to find how many clock pulses we need to count. We also have an
 enable signal for the Vertical signal/counter.
 Hcount range: 0 - 3199
*/
module H_counter(clk, reset, H_count, V_counter_enable);

    input clk, reset;
    output [11:0] H_count;
    reg [11:0] H_count;
    reg V_counter_enable;
    output V_counter_enable;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            H_count <= 1'b0;
            V_counter_enable <= 1'b0;
        end
        // if H_count == 3199 -> Hcount <= 0 , V_count_enable <= 0
        else if(H_count == 12'b110001111111)
        begin
            H_count <= 1'b0;
            V_counter_enable <= 1'b0;
        end
        // if H_count == 3198 -> Hcount++ , V_count_enable <= 1
        else if(H_count == 12'b110001111110)
        begin
            H_count <= H_count + 1'b1;
            V_counter_enable <= 1'b1;
        end
        else
        begin
            H_count <= H_count + 1'b1;
            V_counter_enable <= 1'b0;
        end
    end
    
endmodule
