`timescale 1ns / 1ps

module LEDdecoder_testbench;
    reg [3:0] char;
    wire [6:0] LED;
    
    //Module instantiation
    LEDdecoder UUT (
        .char(char),
        .LED(LED)
    );
    
    initial
    begin
        #100
        
        //all 16 inputs with delay 10ns
        #10 char = 0;
        #10 char = 1;
        #10 char = 2;
        #10 char = 3;
        #10 char = 4;
        #10 char = 5;
        #10 char = 6;
        #10 char = 7;
        #10 char = 8;
        #10 char = 9;
        #10 char = 'hA;
        #10 char = 'hB;
        #10 char = 'hC;
        #10 char = 'hD;
        #10 char = 'hE;
        #10 char = 'hF;
        #10 $stop;   
    end
endmodule