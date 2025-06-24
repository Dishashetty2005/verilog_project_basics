`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: DISHA SHETTY
// 
// Create Date: 24.06.2025 09:38:10
// Design Name: 
// Module Name: uart
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


module uart(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    output reg  tx_done,
    output reg  tx_serial
    );
    parameter idle=0,start_bit=1,data_bit_0=2,data_bit_1=3,data_bit_2=4,data_bit_3=5,data_bit_4=6,data_bit_5=7,data_bit_6=8,data_bit_7=9,stop_bit=10;
    reg [3:0] pr_state,nxt_state;
    always@(posedge clk or posedge reset)begin
    if(reset)
    pr_state<=idle;
    else
    pr_state<=nxt_state;
    end
    
    always@(tx_start,data_in,pr_state)begin
    case(pr_state)
    idle:if(tx_start) nxt_state=start_bit;
         else nxt_state=idle;
    start_bit:nxt_state=data_bit_0;
    data_bit_0:nxt_state=data_bit_1;
    data_bit_1:nxt_state=data_bit_2;
    data_bit_2:nxt_state=data_bit_3;
    data_bit_3:nxt_state=data_bit_4;
    data_bit_4:nxt_state=data_bit_5;
    data_bit_5:nxt_state=data_bit_6;
    data_bit_6:nxt_state=data_bit_7;
    data_bit_7:nxt_state=stop_bit;
    stop_bit:nxt_state=idle;
    default:nxt_state=idle;
    endcase
    end
    
    always@(pr_state)begin
    case(pr_state)
    idle:tx_serial=1;
    start_bit:tx_serial=1'b0;
    data_bit_0:tx_serial=data_in[0];
    data_bit_1:tx_serial=data_in[1];
    data_bit_2:tx_serial=data_in[2];
    data_bit_3:tx_serial=data_in[3];
    data_bit_4:tx_serial=data_in[4];
    data_bit_5:tx_serial=data_in[5];
    data_bit_6:tx_serial=data_in[6];
    data_bit_7:tx_serial=data_in[7];
    stop_bit:tx_serial=1'b1;
    endcase
    end  
    always@(posedge clk or posedge reset)begin
    if(reset)
    tx_done<=1'b0;
    else if(pr_state==stop_bit)
    tx_done<=1'b1;
    else
    tx_done<=1'b0;
    end    
endmodule
