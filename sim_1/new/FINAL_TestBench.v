`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 04:12:51 PM
// Design Name: 
// Module Name: FINAL_TestBench
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


module FINAL_TestBench(

    );
    reg CLK, RST, INIT;
    wire check;
    Unlock_Check UUT(.CLK(CLK), .RST(RST), .INIT(INIT), .check(check));
    
    initial begin
    RST = 1'b1;
    #40;
    RST = 1'b0;
    INIT = 1'b1;
    #20;
    INIT = 1'b0;
    
    end
    
    always begin
    CLK = 1'b1;
    #20;
    
    CLK = 1'b0;
    #20;
    end
endmodule
