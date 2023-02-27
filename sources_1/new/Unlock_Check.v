`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 04:09:57 PM
// Design Name: 
// Module Name: Unlock_Check
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


module Unlock_Check(
input CLK, RST, INIT, output check
    );
    reg finalCheck;
    assign check = finalCheck;
    
    always@(posedge CLK)begin
        if(RST) begin
            finalCheck = 1'b0;
            end
        else if(INIT == 1'b1)begin
            finalCheck <= 1'b1;
            end
        else begin
            finalCheck <= 1'b0;
            end
        end
endmodule
