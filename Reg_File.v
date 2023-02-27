`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 01:18:01 PM
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(
input CLK, WR, RST,
input[1:0] regSel, outSel,
input [4:0] reg0, reg1, reg2,
output[4:0] opRead0, opRead1, opRead2
    );
    //reg [4:0] reg0, reg1, reg2, reg3, reg4, reg5;
    reg [4:0] fileOut, fileOut1, fileOut2;
    assign opRead0 = fileOut;
    assign opRead1 = fileOut1;
    assign opRead2 = fileOut2;
    always @(posedge CLK) begin
            if(RST)begin
                fileOut <= 5'b0;
                fileOut1 <= 5'b0;
                fileOut2 <= 5'b0;
            end
            else if(WR)begin  //get value from register
                if(outSel == 2'b00) begin
                    if(regSel == 2'b00) begin
                        fileOut <= reg0;
                        fileOut1 <= reg0;
                        fileOut2 <= reg0;
                        end
                    else if(regSel == 2'b01) begin
                        fileOut <= reg1;
                        fileOut1 <= reg2;
                        fileOut2 <= reg0;
                        end
                    else if(regSel == 2'b10) begin
                        fileOut <= reg2;
                        fileOut1 <= reg0;
                        fileOut2 <= reg1;
                        end
                end
                else if(outSel == 2'b01) begin  //1st register output stays the same
                    if(regSel == 2'b00) begin
                        fileOut <= reg0;
                        fileOut1 <= reg1;
                        fileOut2 <= reg2;
                        end
                     else if(regSel == 2'b01) begin //swap other two registers
                        fileOut <= reg0;
                        fileOut1 <= reg2;
                        fileOut2 <= reg1;
                        end
                        
                    end
                else if(outSel == 2'b10) begin  //2nd register output stays the same
                     if(regSel == 2'b00) begin
                        fileOut <= reg0;
                        fileOut1 <= reg1;
                        fileOut2 <= reg2;
                        end
                     else if(regSel == 2'b01) begin
                        fileOut <= reg2;
                        fileOut1 <= reg1;
                        fileOut2 <= reg0;
                        end
                end
              else if(outSel == 2'b11) begin    //3rd register stays the same
                    if(regSel == 2'b00) begin
                        fileOut <= reg0;
                        fileOut1 <= reg1;
                        fileOut2 <= reg2;
                        end
                     else if(regSel == 2'b01) begin
                        fileOut <= reg1;
                        fileOut1 <= reg0;
                        fileOut2 <= reg2;
                        end
                end
            end
    end
endmodule
