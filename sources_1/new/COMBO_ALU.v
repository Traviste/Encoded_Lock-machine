`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2022 04:36:02 PM
// Design Name: 
// Module Name: COMBO_ALU
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


module COMBO_ALU(
input CLK, RST, LOAD,
input [4:0] A, B, C,
output[4:0] out0, out1, out2
    );
  wire [4:0] toDivide, avgOut, refOut, diff0, diff1, diff2;
  adder inputs(.CLK(CLK), .RST(RST), .A(A), .B(B), .C(C), .sum(toDivide));	//take inputs
  
  divider avg(.CLK(CLK), .RST(RST), .A(toDivide), .divOut(avgOut));	//find average
  
  LFSR ref(.CLK(CLK), .RST(RST), .LOAD(LOAD), .INIT(avgOut), .q(refOut));	//find offset
  subtractor check1(.CLK(CLK), .RST(RST), .A(refOut), .B(A),.diff(out0));
  subtractor check2(.CLK(CLK), .RST(RST), .A(refOut), .B(B),.diff(out1));
  subtractor check3(.CLK(CLK), .RST(RST), .A(refOut), .B(C),.diff(out2));
  
endmodule

module subtractor(
input CLK, RST,
input [4:0] A, B,
output [4:0] diff
);
reg [4:0] num;
assign diff = num;
    always @(posedge CLK)
        if(RST) begin
            num <= 1'b0;
        end
        else if(A < B)begin
            num <= 30 - (B- A);
        end
        else begin
            num <= (A -B);
        end
endmodule

module adder( 
input CLK, RST,
input [4:0] A, B, C,
output[4:0] sum
);
    reg [4:0] num;
    assign sum = num;
    
    always @(posedge CLK)begin
    if(RST) begin
        num <= 0;
        end
    else if( A + B + C > 30)begin    //no value greater than 30
        num <= (A + B + C) - 30;
        end
    else begin
        num <= A + B + C;
        end
    end
endmodule

module divider(
input CLK, RST,
input [4:0] A,
output[4:0] divOut);

reg [4:0] quote;
assign divOut = quote;

always @(posedge CLK) begin
    if(RST) begin
        quote <= 1'b0;
        end
    else begin
        quote <= A /3;
        end
    end

endmodule