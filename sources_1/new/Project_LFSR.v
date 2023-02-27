`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2022 04:04:35 PM
// Design Name: 
// Module Name: Project_LFSR
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


module LFSR(
input CLK, RST, LOAD, [4:0] INIT, output [4:0] q 
    );
    reg [4:0] out;
    assign q = out[4:0];
    integer i, newbit;
    always @(posedge CLK) begin
    if(LOAD) begin
      out = INIT; 
    end
    else if(RST)begin
       out = 1'b0;
    end
    else begin
        for(i = 0; i < 5; i= i +1)begin
            newbit = out[0] ^ out[2];
            newbit = newbit<<4;
            out = (out >> 1) | newbit;
            end
    end
  end
endmodule
