`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 12:41:09 PM
// Design Name: 
// Module Name: LOCK_LEVEL
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

module LOCK_LEVEL(
input CLK, RST,
input LOAD, LOAD0, LOAD1, LOAD2, LOAD3,
input [4:0] A, B, C,  //ALU module
input WR, EN1, right1, left1, EN2, right2, left2, EN3, right3, left3,
input[2:0] regSel, outSel,  //reg file module
output[4:0] out1, out2, out3, out4, out5, out6,
output res

    );  //top level module
    
    reg [4:0] prevState = 5'b0;
    wire [4:0] counterOut, counterOut1, counterOut2;
    wire [2:0] count, count1, count2;
    wire level;
    //wire count, count1, count2, level, level1, level2, inState1;
    wire [4:0] refOut1, refOut2, refOut3, opRead0, opRead1, opRead2/*, checkNext0, checkNext1, checkNext2*/;    
    
    //store values into register file
    //Enable_RST back1(.CLK(CLK), .RST(RST), .IN(level), .restart(inState1));
    
    COMBO_ALU avg1(.CLK(CLK), .LOAD(LOAD0), .RST(RST), .A(A), .B(B), .C(C), .out0(refOut1), .out1(refOut2), .out2(refOut3));
    Reg_File storeVal(.CLK(CLK), .WR(WR), .RST(RST), .regSel(regSel), .outSel(outSel), .reg0(refOut1), .reg1(refOut2), .reg2(refOut3), .opRead0(opRead0), .opRead1(opRead1), .opRead2(opRead2));
    
    Combo_Check seqCheck1(.CLK(CLK), .RST(RST), .LOAD(LOAD), .check1(opRead0), .check2(opRead1), .check3(opRead2), .check4(counterOut), .check5(counterOut1), .check6(counterOut2), .out1(out1), .out2(out2), .out3(out3), .out4(out4), .out5(out5), .out6(out6), .res(level));
    
    Unlock_Check final(.CLK(CLK), .RST(RST), .INIT(level), .check(res));
    
    Quadrature_Encoder padShift(.CLK(CLK), .RST(RST), .LOAD(LOAD1), .right(right1), .left(left1), .direction(count));
    Lock_Counter lockNum(.CLK(CLK), .RST(RST), .sel(count), .EN(EN1), .prevState(prevState), .numCounter(counterOut));
    
    Quadrature_Encoder padShift1(.CLK(CLK), .RST(RST), .LOAD(LOAD2), .right(right2), .left(left2), .direction(count1));
    Lock_Counter lockNum2(.CLK(CLK), .RST(RST), .sel(count1), .EN(EN2), .prevState(counterOut), .numCounter(counterOut1));
    
    Quadrature_Encoder padShift2(.CLK(CLK), .RST(RST), .LOAD(LOAD3), .right(right3), .left(left3), .direction(count2));
    Lock_Counter lockNum3(.CLK(CLK), .RST(RST), .sel(count2), .EN(EN3), .prevState(counterOut1), .numCounter(counterOut2));
    
    //Enable_RST back(.CLK(CLK), .RST(RST), .EN(EN4), .IN(level), .restart(restart)); 
endmodule
