`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 07:40:15
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] A,
    input [3:0] B,
    input [3:0] op,
    output reg [4:0] result
    );
    always@(*)begin
    case(op)
    4'b0000:result=A+B;
    4'b0001:result=A-B;
    4'b0010:result={1'b0,A&B};
    4'b0011:result={1'b0,A|B};
    4'b0100:result={1'b0,A^B};
    4'b0101:result={1'b0,~A};
    4'b0110:result={1'b0,~B};
    4'b0111:result=A+1;
    4'b1000:result=A-1;
    4'b1001:result={1'b0,~(A&B)};
    4'b1010:result={1'b0,~(A|B)};
    4'b1011:result={1'b0,~(A^B)};
    4'b1100:if(A==B)result=5'b00001;
           else result=5'b00000;
    4'b1101:result=A<<1;
    4'b1110:result=A>>1;
    4'b1111:if(A>B)result=5'b00001;
            else result=5'b00000;
        default:result=5'b00000;
    endcase
    end
    
    
endmodule
