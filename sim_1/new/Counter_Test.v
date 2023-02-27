`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 01:46:11 PM
// Design Name: 
// Module Name: Counter_Test
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


module Counter_Test();
reg CLK, RST, EN;
reg [1:0] sel;
reg [4:0] prevState;
//wire cont;
wire [4:0] numCounter;
Lock_Counter UUT(.CLK(CLK), .sel(sel), .RST(RST), .EN(EN), .prevState(prevState), .numCounter(numCounter));
initial begin
RST = 1'b1;
//INIT = 1'b1;
#20;

RST = 1'b0;
#20;

prevState =  5'b10010;
#20;

EN = 1'b1;
#40;
EN = 1'b0;
#20;

sel = 2'b01;
#40;

RST = 1'b1;
#60;
sel = 1'b0;
RST = 1'b0;
#100;
sel = 1'b1;
#40;

sel = 2'b11;
#80;
//RST = 1'b1;
sel = 1'b0;

#60;
sel = 2'b11;

end

always begin
CLK = 1'b0;
#10;
CLK = 1'b1;
#10;
end

endmodule