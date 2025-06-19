`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 10:13:44
// Design Name: 
// Module Name: calculator
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

module fulladder(input A,input B,input Cin,output sum,output Cout);
assign sum=A^B^Cin;
assign Cout=(A&B)|(B&Cin)|(Cin&A);
endmodule

module calculator(
    input [3:0]A,
    input [3:0]B,
    input op,
    output reg [4:0]RESULT
    );
    wire [3:0]find_sum,find_sub;
    wire c0,c1,c2;
    wire d0,d1,d2;
    wire [3:0]inv_b;
    wire [3:0]two_comp;
    wire cout_sum;
    wire cout_sub;
    assign inv_b=~B;
    assign two_comp=inv_b+1;   
 always@(*)begin
case(op)
1'b0:RESULT={cout_sum,find_sum};
1'b1:RESULT={cout_sub,find_sub};
default:RESULT=5'b00000;
endcase
end
fulladder fa1(A[0],B[0],1'b0,find_sum[0],c0);
fulladder fa2(A[1],B[1],c0,find_sum[1],c1);
fulladder fa3(A[2],B[2],c1,find_sum[2],c2);
fulladder fa4(A[3],B[3],c2,find_sum[3],cout_sum);

fulladder fa5(A[0],two_comp[0],1'b0,find_sub[0],d0);
fulladder fa6(A[1],two_comp[1],d0,find_sub[1],d1);
fulladder fa7(A[2],two_comp[2],d1,find_sub[2],d2);
fulladder fa8(A[3],two_comp[3],d2,find_sub[3],cout_sub);
endmodule
