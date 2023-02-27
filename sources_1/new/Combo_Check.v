`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 02:15:28 PM
// Design Name: 
// Module Name: Combo_Check
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


module Combo_Check(
input CLK, RST, LOAD,
input [4:0] check1, check2, check3, check4, check5, check6,
output res,
output [4:0] out1, out2, out3, out4, out5, out6
    );
    reg compareCheck;
    reg [4:0]in1, in2, in3, in4, in5, in6;
    assign out1 = in1;
    assign out2 = in2;
    assign out3 = in3;
    assign out4 = in4;
    assign out5 = in5;
    assign out6 = in6;
    
    assign res = compareCheck;
    
    always@(posedge CLK)begin
        if(RST) begin
            compareCheck <= 1'b0;
            in1 <= 5'b0;
            in2 <= 5'b0;
            in3 <= 5'b0;
            in4 <= 5'b0;
            in5 <= 5'b0;
            in6 <= 5'b0;
            end
        else if(LOAD) begin
            if((check1 == check4) && (check2 == check5) && (check3 == check6)) begin
                compareCheck <= 1'b1;   // values are equal so output is 1
                in1 <= check1;
                in2 <= check2;
                in3 <= check3;
                in4 <= check4;
                in5 <= check5;
                in6 <= check6;
                end
            else if((check1 != check4) || (check2 != check5) || (check3 != check6)) begin
                compareCheck <= 1'b0;   //values are not equal output is 0, resets entire system
                in1 <= check1;
                in2 <= check2;
                in3 <= check3;
                in4 <= check4;
                in5 <= check5;
                in6 <= check6;
                end
            end
    end
endmodule
