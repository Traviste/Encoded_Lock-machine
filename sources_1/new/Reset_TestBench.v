`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2022 04:03:06 PM
// Design Name: 
// Module Name: Reset_TestBench
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


module Reset_TestBench(

    );
    
    reg CLK, IN, RST;
    wire restart;
    
    Enable_RST UUT(.CLK(CLK), .RST(RST), .IN(IN), .restart(restart));
    initial begin
    RST = 1'b1;
    #40;
    RST = 1'b0;
    IN = 1'b1;
    #60;
    
    IN = 1'b0;
    
    end
    
    always begin
    CLK = 1'b1;
    #20;
    CLK = 1'b0;
    #20;
    end
endmodule
