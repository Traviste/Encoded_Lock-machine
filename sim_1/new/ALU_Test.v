`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 01:27:37 PM
// Design Name: 
// Module Name: ALU_Test
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


module ALU_Test(
    );
    reg [4:0] A, B, C;
    reg CLK, LOAD, RST;
    //reg [1:0] sel;
    wire [4:0] out0, out1, out2;
    COMBO_ALU UUT(.CLK(CLK), .LOAD(LOAD), .RST(RST), .A(A), .B(B), .C(C), .out0(out0), .out1(out1), .out2(out2));
    initial begin
    RST = 1'b1;
    #30;
    RST = 1'b0;
    #20;
    
    LOAD = 1'b1;
    A = 5'b11110;
    B = 5'b00011;
    C = 5'b01010;
    #140
    
    LOAD = 1'b0; 
    
    #120;
    
    LOAD = 1'b1;
     
    end
    
    always begin
    CLK = 1'b1;
    #20;
    CLK = 1'b0;
    #20;
    end
endmodule
