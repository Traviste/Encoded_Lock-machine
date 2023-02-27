`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2022 03:39:19 PM
// Design Name: 
// Module Name: Lock_Counter
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


module Lock_Counter(
input CLK, RST, EN,
input[1:0] sel,
input [4:0]prevState,
output [4:0] numCounter
    );
reg[5:0] state;  //initialize hardware states
//reg counter;
//reg continue;
assign numCounter = state;  //assign to output
//assign cont = counter;
integer check = 30; //wraps around 30 and 0
integer dCheck = 0;

/*always @(posedge CLK) begin
    assign continue = INIT;
end*/

always@(posedge CLK)begin
if(RST)begin    //resets all values
    state <= 1'b0;
    end
else if(EN)begin
    state <= prevState;
    end
else if(sel == 2'b00) begin //if select is 0 then count down
    if(state == dCheck) begin //at 0, counter goes to 30 and counts down
        state <= 5'b11110;
        end
    else begin
        state <= state - 1'b1;
        //counter <= state;
        end
end
else if(sel == 2'b01) begin  //if select is 1 then count up
    if(state == check)begin  //at 30 counter goes to 0 and counts up
        state <= 1'b0;
        //counter <= state;
        end
    else begin
        state <= state +1'b1;
        //counter <= state;
        end
    end
else if(sel == 2'b11) begin
    //state <= state; 
    end
end
endmodule
