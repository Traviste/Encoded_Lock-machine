`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2022 03:57:32 PM
// Design Name: 
// Module Name: Enable_RST
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


module Enable_RST(
input CLK, RST, EN, IN, output restart
    );  //RST entire program
    reg ineq;
    assign restart = ineq;  //whenever restart is high it RST all modules
    
    always@(posedge CLK)begin
    if(RST) begin
        ineq <= 1'b1;    //RST all modules
    end
    else if (EN) begin
        if(IN == 1'b0) begin   //if check values don't match reset all
            ineq <= 1'b1;
            end
        else if(IN == 1'b1) begin   //if check values do match
            ineq <= 1'b0;
            end
        end
    end
endmodule
