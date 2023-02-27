`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 03:22:25 PM
// Design Name: 
// Module Name: LFSR_TB
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


module LFSR_TB(

    );
    reg CLK, RST, LOAD;
    reg [4:0] INIT;
    wire [4:0] q;
    LFSR UUT(.CLK(CLK), .RST(RST), .LOAD(LOAD), .INIT(INIT), .q(q));
    
    initial begin
    CLK = 1'b0;
    LOAD = 1'b1;
    INIT = 3'b101;
    RST = 1'b0;
    #10;
    CLK = 1'b1;
    #10;
    LOAD = 1'b0;
    CLK = 1'b0;
    #10;
    CLK = 1'b1;
    #10;
    CLK = 1'b0;
    #10;
    CLK = 1'b1;
    #10;
    CLK = 1'b0;
    #10;
    CLK = 1'b1;
    #10;
    CLK = 1'b0;
    #10;
    CLK = 1'b1;
    #10;
    CLK = 1'b0;
    #10;
    CLK = 1'b1;
    #10;
    CLK = 1'b0;
    #10;
    end
endmodule
