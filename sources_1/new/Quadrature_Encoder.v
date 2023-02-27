`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 02:06:31 PM
// Design Name: 
// Module Name: Quadrature_Encoder
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


module Quadrature_Encoder(
input CLK, RST, LOAD, right, left, 
output [1:0] direction
    );  //do your state machine here!!
    parameter S00 = 2'b11;  //stays the same
    parameter S01 = 2'b01;  //goes right
    parameter S10 = 2'b10;  //goes left
    
    //reg rightShift, leftShift;
    //reg EN; //so that you don't need to constantly control Load signal
    reg [1:0] outVal, state, AB;
    
    integer count = 2;
    integer sample = 0;
    
    assign direction = outVal; //out wire determines counter direction (1 for clkwise and 0 for counter)
    
    /*always @(posedge CLK) begin
        EN <= LOAD;
        EN <= 1'b0;
    end*/
    always @(posedge CLK)begin
        if(RST)begin
            state <= S00;
            outVal <= 2'b11; //transition or original state
            end
         else if(LOAD /*EN*/)begin
            /*rightShift <= right;    //loads a and b (user input lock in for direction of encoder)
            leftShift <= left;*/
            AB <= {left, right};
         end
         else begin //check for shift
            case (state)
                S00: if( AB == 2'b01) begin
                        state <= S01;
                        outVal <= 2'b01;    //goes right
                        end
                    else if(AB == 2'b10) begin
                        state <= S10;
                        outVal <= 2'b00;    //goes left
                        end
                    else if(AB == 2'b11) begin
                        state <= S00;
                        outVal <= AB;   //counter stays the same
                        end
                S01: if(AB == 2'b01)begin
                        state <= S10;
                        outVal <= 2'b01;    //goes right
                        end 
                      else if(AB == 2'b10) begin
                        state <= S00;
                        outVal <= 2'b00;    //goes left
                        end
                      else if(AB == 2'b11) begin
                        state <= S01;
                        outVal <= AB;   //counter stays the same
                        end
                 S10: if(AB == 2'b01)begin
                        state <= S00;
                        outVal <= 2'b01;    //goes right
                        end
                      else if(AB == 2'b10) begin
                        state <= S01;
                        outVal <= 2'b00;    //goes left
                        end
                      else if(AB == 2'b11) begin
                        state <= S10;
                        outVal <= 2'b11;    //counter stays the same
                        end
            endcase
         end
         /*else begin //otherwise do nothing
         
         end*/
   end
endmodule
