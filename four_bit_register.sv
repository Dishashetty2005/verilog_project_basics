`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 10:58:07
// Design Name: 
// Module Name: dff
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


module dff(
    input d,
    input clk,
    input reset,
    output reg q
    );
    always@(posedge clk,posedge reset)begin
    if(reset)
    q<=1'b0;
    else
    q<=d;
    end
endmodule

module four_bit_register(
        input clk,
        input reset,
        input [3:0]in,
        output [3:0]out);
    dff dff0(in[0],clk,reset,out[0]);
    dff dff1(in[1],clk,reset,out[1]);
    dff dff2(in[2],clk,reset,out[2]);
    dff dff3(in[3],clk,reset,out[3]);
    endmodule
