`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 03:55:28 PM
// Design Name: 
// Module Name: LOCK_TB
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


module LOCK_TB(

    );
    //LOAD0: ALU
    //LOAD1-3: Quadrature Encoder
    //LOAD4: Final check
    reg CLK, RST;
    reg [4:0] A, B, C; 
    reg LOAD, LOAD0, LOAD1, LOAD2, LOAD3;
    reg WR, EN1, right1, left1, EN2, right2, left2, EN3, right3, left3;
    reg [2:0] regSel, outSel;
    wire res;
    wire [4:0] out1, out2, out3, out4, out5, out6;
    //reg LOAD1, LOAD2, LOAD3;
    //reg right1, right2, right3, left1, left2, left3, EN1, EN2, EN3;
    //reg [4:0] reg0, reg1, reg2;
    //reg [4:0] INIT;
    //wire[4:0] countOut;
    //wire q, res;
    LOCK_LEVEL UUT(
    .CLK(CLK), .RST(RST),
    .LOAD(LOAD), .LOAD0(LOAD0), .LOAD1(LOAD1), .LOAD2(LOAD2), .LOAD3(LOAD3),
    .A(A), .B(B), .C(C),
    .right1(right1), .left1(left1), .EN1(EN1), .right2(right2), .left2(left2), .EN2(EN2), .right3(right3), .left3(left3), .EN3(EN3),
    .WR(WR), //.EN4(EN4),
    .regSel(regSel), .outSel(outSel),
    .out1(out1), .out2(out2), .out3(out3), .out4(out4), .out5(out5), .out6(out6), .res(res)
    //.counterOut(countOut)
    //.reg0(reg0), .reg1(reg1), .reg2(reg2),
    //.res(res),
    //.LOAD1(LOAD1), .LOAD2(LOAD2), .LOAD3(LOAD3),
    //.right1(right1), .right2(right2), .right3(right3), .left1(left1), .left2(left2), .left3(left3), .EN1(EN1), .EN2(EN2), .EN3(EN3),  
    );

    initial begin
    RST = 1'b1; //initialize every value to 0
    #40;
    RST = 1'b0;
    //{ /*LOAD1, LOAD2, LOAD3, LOAD4*/} = 1'b1; //all levels of the lock waiting for input
    #20;
    
    //EN4 = 1'b0; //initialize RST
    LOAD1 = 1'b1;   //first counter
    EN1 = 1'b0;
    right1 = 1'b0;
    left1 = 1'b1;
    #60;
    
    LOAD1 = 1'b0;
    #480;
    
    LOAD1 = 1'b1;
    right1 = 1'b1;
    left1 = 1'b1;
    #40;
    
    LOAD1 = 1'b0;
    #20;
    
    EN2 = 1'b1;
    #40;
    
    EN2 = 1'b0;
    LOAD2 = 1'b1;
    right2 = 1'b0;
    left2 = 1'b1;
    #60;
    
    LOAD2 = 1'b0;
    #200;
    
    LOAD2 = 1'b1;
    right2 = 1'b1;
    left2 = 1'b1;
    #40;
    
    LOAD2 = 1'b0;
    #20;
    
    EN3 = 1'b1;
    #40;
    
    EN3 = 1'b0;
    LOAD3 = 1'b1;
    right3 = 1'b0;
    left3 = 1'b1;
    #60;
    
    LOAD3 = 1'b0;
    #80;
    
    LOAD3 = 1'b1;
    right3 = 1'b1;
    left3 = 1'b1;
    #40;
    
    LOAD3 = 1'b0;
    #20;
    
    LOAD0 = 1'b1;
    A = 5'b11000;
    B = 5'b11110;
    C = 5'b00011;
    #140;
    
    LOAD0 = 1'b0;
    #120;
    
    LOAD0 = 1'b1;
    #20;  
    
    WR = 1'b1;
    outSel = 2'b01;
    regSel = 2'b00;
    #40;
    
    //E = 5'b01100;
    //F = 5'b01001;
    LOAD = 1'b1;
    #40;
    LOAD = 1'b0;
    #40;
    
    /*EN4 = 1'b1;
    #40;
    EN4 = 1'b0;*/
    end

    always begin
    CLK = 1'b1;
    #20;
    CLK = 1'b0;
    #20;
    end
endmodule
