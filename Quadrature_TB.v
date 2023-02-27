`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 01:27:50 PM
// Design Name: 
// Module Name: Quadrature_TB
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


module Quadrature_TB(

    );
    reg CLK,RST, LOAD, right, left;
    wire [1:0] direction;
    
    Quadrature_Encoder UUT(.CLK(CLK), .RST(RST), .LOAD(LOAD), .right(right), .left(left), .direction(direction));
    
    initial begin
    RST = 1'b1; //initialize all values to 0
    #40;
    RST = 1'b0;
    #20;
    
    LOAD = 1'b1;
    right = 1'b1;
    left = 1'b0;
    #40;
    
    LOAD = 1'b0;
    #60;
    
    LOAD = 2'b1;
    right = 1'b1;
    left = 1'b1;
    #40;
    
    LOAD = 1'b0;
    #60;
    
    LOAD = 1'b1;
    right = 1'b0;
    left = 1'b1;
    #40;
    
    LOAD = 1'b0;
    
    end
    
    always begin
    CLK = 1'b1;
    #20;
    CLK = 1'b0;
    #20;
    end
endmodule
