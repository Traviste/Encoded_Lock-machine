`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 01:38:40 PM
// Design Name: 
// Module Name: File_TB
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


module File_TB(

    );  //testbench for register file
    reg CLK, RST, WR;
    reg [1:0] regSel, outSel;
    reg [4:0] reg0, reg1, reg2;
    wire [4:0] opRead0, opRead1, opRead2;
    Reg_File UUT(.RST(RST), .CLK(CLK), .WR(WR), .regSel(regSel), .outSel(outSel), .reg0(reg0), .reg1(reg1), .reg2(reg2), .opRead0(opRead0), .opRead1(opRead1), .opRead2(opRead2));
initial begin
RST = 1'b1;
reg0 = 5'b11110;
reg1 = 5'b10110;
reg2 = 5'b00011;
#60;

RST = 1'b0;
//regIn = 5'b01001;
WR = 1'b1;
outSel = 2'b01;
regSel = 2'b00; //first register denoted by 00 NOT 01
//READ = 1'b0;
#40;


outSel = 2'b10;
regSel = 2'b01;
#40;

outSel = 2'b11;
regSel = 2'b10;
#40;


WR = 1'b0;
//READ = 1'b1;
#40;

/*regIn = 5'b10101;
regSel = 3'b000;
#20;

WR = 1'b1;
//READ = 1'b0;
#40;
*/

end

always begin
CLK = 1'b1;
#20;
CLK = 1'b0;
#20;
end

endmodule
