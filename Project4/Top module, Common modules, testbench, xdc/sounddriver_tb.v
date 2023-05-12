`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2023 23:06:54
// Design Name: 
// Module Name: sounddriver_tb
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


module sounddriver_tb;
    reg reset;
    reg clk;
    
    // Recording Interface //
    reg recordBtnEN;
    reg micDataPDM;
    wire micGenCLK, micLRselPDM;
    
    
    // Playback Interface //
    reg playbackBtnEN;
    wire audDataPWM;
    wire audEnPWM;
    
    initial
    begin
        clk = 0;
        reset = 1;
        #100 reset = 0;
        #400recordBtnEN = 1;
        
        micDataPDM = 1;
        #500 recordBtnEN = 0;
        
        @(posedge clk) micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        #500 micDataPDM = 1;
        #500 micDataPDM = 0;
        #500 micDataPDM = 1;
        
        #15000000 playbackBtnEN = 1;
        #500 playbackBtnEN = 0;
        
        
        
    end
    
    always 
    begin
        #5 clk = ~clk;
    end
    
    sounddriver snd(reset, clk, recordBtnEN, micGenCLK, micDataPDM, micLRselPDM, playbackBtnEN, audDataPWM, audEnPWM);
    
endmodule
