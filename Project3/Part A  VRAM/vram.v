`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2022 16:10:43
// Design Name: 
// Module Name: vram
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
 This module is to create and store the image to the memory and be able to recall it
 when we want to display it. To do that we initialize 3 block-rams each for every colour
 red, green, blue and we set suitably the values of the colours to create the desirable image. 
*/
module vram(clk, reset, addr, red_col, green_col, blue_col);
    
    input clk, reset;
    input [13:0] addr;
    output red_col;
    output green_col;
    output blue_col;
     
     // BRAM_SINGLE_MACRO : In order to incorporate this function into the design,
     //   Verilog   : the following instance declaration needs to be placed
     //  instance   : in the body of the design code.  The instance name
     // declaration : (BRAM_SINGLE_MACRO_inst) and/or the port declarations within the
     //    code     : parenthesis may be changed to properly reference and
     //             : connect this function to the design.  All inputs
     //             : and outputs must be connected.
     
     //  <-----Cut code below this line---->
     
        // BRAM_SINGLE_MACRO: Single Port RAM
        //                    Artix-7
        // Xilinx HDL Language Template, version 2017.4
        
        /////////////////////////////////////////////////////////////////////
        //  READ_WIDTH | BRAM_SIZE | READ Depth  | ADDR Width |            //
        // WRITE_WIDTH |           | WRITE Depth |            |  WE Width  //
        // ============|===========|=============|============|============//
        //    37-72    |  "36Kb"   |      512    |    9-bit   |    8-bit   //
        //    19-36    |  "36Kb"   |     1024    |   10-bit   |    4-bit   //
        //    19-36    |  "18Kb"   |      512    |    9-bit   |    4-bit   //
        //    10-18    |  "36Kb"   |     2048    |   11-bit   |    2-bit   //
        //    10-18    |  "18Kb"   |     1024    |   10-bit   |    2-bit   //
        //     5-9     |  "36Kb"   |     4096    |   12-bit   |    1-bit   //
        //     5-9     |  "18Kb"   |     2048    |   11-bit   |    1-bit   //
        //     3-4     |  "36Kb"   |     8192    |   13-bit   |    1-bit   //
        //     3-4     |  "18Kb"   |     4096    |   12-bit   |    1-bit   //
        //       2     |  "36Kb"   |    16384    |   14-bit   |    1-bit   //
        //       2     |  "18Kb"   |     8192    |   13-bit   |    1-bit   //
        //       1     |  "36Kb"   |    32768    |   15-bit   |    1-bit   //
        //       1     |  "18Kb"   |    16384    |   14-bit   |    1-bit   //
        /////////////////////////////////////////////////////////////////////
     
        BRAM_SINGLE_MACRO #(
           .BRAM_SIZE("18Kb"), // Target BRAM, "18Kb" or "36Kb" 
           .DEVICE("7SERIES"), // Target Device: "7SERIES" 
           .DO_REG(0), // Optional output register (0 or 1)
           .INIT(36'h000000000), // Initial values on output port
           .INIT_FILE ("NONE"),
           .WRITE_WIDTH(1), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
           .READ_WIDTH(1),  // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
           .SRVAL(36'h000000000), // Set/Reset value for port output
           .WRITE_MODE("NO_CHANGE"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
           .INIT_00(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines red
           .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_02(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines red
           .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_04(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines red
           .INIT_05(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_06(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines red
           .INIT_07(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_08(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines red
           .INIT_09(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_0A(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines red
           .INIT_0B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           
           .INIT_0C(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
           .INIT_0D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_0E(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
           .INIT_0F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_10(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
           .INIT_11(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_12(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
           .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_14(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
           .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_16(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
           .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           
           .INIT_18(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
           .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_1A(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
           .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_1C(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
           .INIT_1D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_1E(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
           .INIT_1F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_20(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
           .INIT_21(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           .INIT_22(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
           .INIT_23(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
           
           .INIT_24(256'h0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f__0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f),
           .INIT_25(256'h0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f__0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f),
           .INIT_26(256'h0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f__0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f),
           .INIT_27(256'h0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f__0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f),
           .INIT_28(256'h0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f__0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f),
           .INIT_29(256'h0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f__0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f),
           .INIT_2A(256'h0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f__0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f),
           .INIT_2B(256'h0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f__0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f),
           .INIT_2C(256'h0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f__0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f),
           .INIT_2D(256'h0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f__0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f),
           .INIT_2E(256'h0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f__0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f_000_0_0_f),
           .INIT_2F(256'h0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f__0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f_fff_0_0_f)
           
           /*
           .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
           
           // The next set of INIT_xx are valid when configured as 36Kb
           .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
           
           // The next set of INITP_xx are for the parity bits
           .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
           
           // The next set of INIT_xx are valid when configured as 36Kb
           .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
           .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000)*/
           
           
        ) BRAM_SINGLE_MACRO_red (
           .DO(red_col),       // Output data, width defined by READ_WIDTH parameter
           .ADDR(addr),   // Input address, width defined by read/write port depth
           .CLK(clk),     // 1-bit input clock
           .DI(1'b0),       // Input data port, width defined by WRITE_WIDTH parameter
           .EN(1'b1),       // 1-bit input RAM enable
           .REGCE(1'b1), // 1-bit input output register enable
           .RST(reset),     // 1-bit input reset
           .WE(1'b0)        // Input write enable, width defined by write port depth
        );
        
        
        
        
        
        
        
        
        
         BRAM_SINGLE_MACRO #(
                  .BRAM_SIZE("18Kb"), // Target BRAM, "18Kb" or "36Kb" 
                  .DEVICE("7SERIES"), // Target Device: "7SERIES" 
                  .DO_REG(0), // Optional output register (0 or 1)
                  .INIT(36'h000000000), // Initial values on output port
                  .INIT_FILE ("NONE"),
                  .WRITE_WIDTH(1), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
                  .READ_WIDTH(1),  // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
                  .SRVAL(36'h000000000), // Set/Reset value for port output
                  .WRITE_MODE("NO_CHANGE"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
                  .INIT_00(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                  .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_02(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                  .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_04(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                  .INIT_05(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_06(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                  .INIT_07(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_08(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                  .INIT_09(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_0A(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                  .INIT_0B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  
                  .INIT_0C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines green
                  .INIT_0D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_0E(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines green
                  .INIT_0F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_10(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines green
                  .INIT_11(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_12(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines green
                  .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_14(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines green
                  .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_16(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines green
                  .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  
                  .INIT_18(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
                  .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_1A(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
                  .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_1C(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
                  .INIT_1D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_1E(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
                  .INIT_1F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_20(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
                  .INIT_21(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  .INIT_22(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines blue
                  .INIT_23(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                  
                  .INIT_24(256'hf_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0__f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0),
                  .INIT_25(256'hf_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0__f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0),
                  .INIT_26(256'hf_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0__f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0),
                  .INIT_27(256'hf_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0__f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0),
                  .INIT_28(256'hf_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0__f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0),
                  .INIT_29(256'hf_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0__f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0),
                  .INIT_2A(256'hf_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0__f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0),
                  .INIT_2B(256'hf_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0__f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0),
                  .INIT_2C(256'hf_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0__f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0),
                  .INIT_2D(256'hf_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0__f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0),
                  .INIT_2E(256'hf_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0__f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0_000_0_f_0),
                  .INIT_2F(256'hf_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0__f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0_fff_0_f_0)
                  
                  /*
                  .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  
                  // The next set of INIT_xx are valid when configured as 36Kb
                  .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  
                  // The next set of INITP_xx are for the parity bits
                  .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  
                  // The next set of INIT_xx are valid when configured as 36Kb
                  .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                  .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000)*/
                  
                  
               ) BRAM_SINGLE_MACRO_green (
                  .DO(green_col),       // Output data, width defined by READ_WIDTH parameter
                  .ADDR(addr),   // Input address, width defined by read/write port depth
                  .CLK(clk),     // 1-bit input clock
                  .DI(1'b0),       // Input data port, width defined by WRITE_WIDTH parameter
                  .EN(1'b1),       // 1-bit input RAM enable
                  .REGCE(1'b1), // 1-bit input output register enable
                  .RST(reset),     // 1-bit input reset
                  .WE(1'b0)        // Input write enable, width defined by write port depth
               );
     
        // End of BRAM_SINGLE_MACRO_inst instantiation
        
        
        
        
        
        
        
        
        
        
        
        
        
        BRAM_SINGLE_MACRO #(
                   .BRAM_SIZE("18Kb"), // Target BRAM, "18Kb" or "36Kb" 
                   .DEVICE("7SERIES"), // Target Device: "7SERIES" 
                   .DO_REG(0), // Optional output register (0 or 1)
                   .INIT(36'h000000000), // Initial values on output port
                   .INIT_FILE ("NONE"),
                   .WRITE_WIDTH(1), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
                   .READ_WIDTH(1),  // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
                   .SRVAL(36'h000000000), // Set/Reset value for port output
                   .WRITE_MODE("NO_CHANGE"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
                   .INIT_00(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                   .INIT_01(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_02(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                   .INIT_03(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_04(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                   .INIT_05(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_06(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                   .INIT_07(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_08(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                   .INIT_09(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_0A(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines red
                   .INIT_0B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   
                   .INIT_0C(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
                   .INIT_0D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_0E(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
                   .INIT_0F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_10(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
                   .INIT_11(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_12(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
                   .INIT_13(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_14(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
                   .INIT_15(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_16(256'h00000000000000000000000000000000_00000000000000000000000000000000), //2 lines green
                   .INIT_17(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   
                   .INIT_18(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines blue
                   .INIT_19(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_1A(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines blue
                   .INIT_1B(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_1C(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines blue
                   .INIT_1D(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_1E(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines blue
                   .INIT_1F(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_20(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines blue
                   .INIT_21(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   .INIT_22(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines blue
                   .INIT_23(256'hffffffffffffffffffffffffffffffff_ffffffffffffffffffffffffffffffff), //2 lines white
                   
                   .INIT_24(256'h0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0__0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0),
                   .INIT_25(256'h0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0__0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0),
                   .INIT_26(256'h0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0__0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0),
                   .INIT_27(256'h0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0__0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0),
                   .INIT_28(256'h0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0__0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0),
                   .INIT_29(256'h0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0__0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0),
                   .INIT_2A(256'h0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0__0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0),
                   .INIT_2B(256'h0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0__0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0),
                   .INIT_2C(256'h0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0__0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0),
                   .INIT_2D(256'h0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0__0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0),
                   .INIT_2E(256'h0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0__0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0_000_f_0_0),
                   .INIT_2F(256'h0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0__0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0_fff_f_0_0)
                   
                   /*
                   .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   
                   // The next set of INIT_xx are valid when configured as 36Kb
                   .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   
                   // The next set of INITP_xx are for the parity bits
                   .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   
                   // The next set of INIT_xx are valid when configured as 36Kb
                   .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000)*/
                   
                   
                ) BRAM_SINGLE_MACRO_blue (
                   .DO(blue_col),       // Output data, width defined by READ_WIDTH parameter
                   .ADDR(addr),   // Input address, width defined by read/write port depth
                   .CLK(clk),     // 1-bit input clock
                   .DI(1'b0),       // Input data port, width defined by WRITE_WIDTH parameter
                   .EN(1'b1),       // 1-bit input RAM enable
                   .REGCE(1'b1), // 1-bit input output register enable
                   .RST(reset),     // 1-bit input reset
                   .WE(1'b0)        // Input write enable, width defined by write port depth
                );
                
        
endmodule
