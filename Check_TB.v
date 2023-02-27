`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2022 12:26:56 PM
// Design Name: 
// Module Name: Check_TB
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


module Check_TB();  //testbench lock check block (state machine)
    reg CLK, RST, LOAD;
    reg [4:0] check1, check2, check3, check4, check5, check6;
    wire res; 
    wire [4:0] out1, out2, out3, out4, out5, out6;
    Combo_Check UUT(.CLK(CLK), .RST(RST), .LOAD(LOAD), .check1(check1), .check2(check2), .check3(check3), .check4(check4), .check5(check5), .check6(check6), .out1(out1), .out2(out2), .out3(out3), .out4(out4), .out5(out5), .out6(out6), .res(res));
    initial begin
    RST = 1'b1;
    #40;
    RST = 1'b0;
    #20;
    check1 = 5'b11101;
    check2 = 5'b11101;
    check3 = 5'b00000;
    check4 = 5'b00000;
    check5 = 5'b01001;
    check6 = 5'b01001;
    #20;
    
    LOAD = 1'b1;
    #40;
    LOAD = 1'b0;
    #20;
    
    check1 = 5'b10101;
    check2 = 5'b10101;
    check3 = 5'b11010;
    check4 = 5'b11010;
    check5 = 5'b11100;
    check6 = 5'b11100;
    LOAD = 1'b1;
    #40;
    
    LOAD = 1'b0;
    #80;
    
    RST = 1'b1;
    #70;
    RST = 1'b0;
    
    end
    
    always begin
    CLK = 1'b1;
    #20;
    CLK = 1'b0;
    #20;
    end
endmodule
