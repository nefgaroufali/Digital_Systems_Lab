`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2022 18:26:24
// Design Name: 
// Module Name: sounddriver
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
This is the top module for Part A and Part B. Here are made all the instantiations of the smaller units.

*/
module sounddriver(reset, clk, recordBtnEN, micGenCLK, micDataPDM, micLRselPDM, playbackBtnEN, audDataPWM, audEnPWM);

    input reset;
    input clk;
    wire new_clk;
    
    // Recording Interface //
    input recordBtnEN;
    input micDataPDM;
    output micGenCLK, micLRselPDM;
    
    
    // Playback Interface //
    input playbackBtnEN;
    output audDataPWM;
    output audEnPWM;
    
    
    wire micLRselPDM;
    wire [4:0] thirty_two_count;
    wire [9:0] packets;
    wire [15:0] address;
    wire [3:0] write_enable;
    wire [31:0] data_out, data_in;
    wire [31:0] shifted_micData;
    wire Serial_out;
    wire prepacket;
    wire [8:0] big_count;
    wire [6:0] clock_count;
    wire clock_en;
    assign micLRselPDM = 1'b0;
    
    
    // MMCM - Generate: 2MHz, 200Mhz
    Clock_Division div(clk, reset, micGenCLK, new_clk);
    ThirtyTwo_counter cnt(micGenCLK, reset, thirty_two_count, recordBtnEN, playbackBtnEN);  
    Packets_counter pckts(micGenCLK, reset, thirty_two_count, packets, recordBtnEN, playbackBtnEN, prepacket);
    // deserializer
    shifter shft(micGenCLK, micDataPDM, shifted_micData);
    // block ram
    block_ram ram(micGenCLK, reset, address, data_in, data_out, write_enable);
    // FSM for Part A - Recording
    Recording rec(micGenCLK, reset, recordBtnEN, write_enable, data_in, packets, thirty_two_count, shifted_micData);
    // serializer 
    serializer ser(micGenCLK, thirty_two_count, data_out, Serial_out, playbackBtnEN);
    // FSM for Part B - Playback
    PlayBack pl(micGenCLK, reset, playbackBtnEN, audDataPWM, packets, thirty_two_count, Serial_out, prepacket, audEnPWM, big_count);
    big_counter big(micGenCLK, reset, big_count, prepacket, packets, thirty_two_count);
    address_counter addrss(micGenCLK, reset, thirty_two_count, recordBtnEN, playbackBtnEN, address, prepacket);
    
    clock_counter clkcnt(new_clk, reset, clock_count);
    clock_enable clken(new_clk, reset, clock_count, clock_en);

endmodule
