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
    input [1:0]op,
    output reg [7:0]RESULT
    );
    wire [3:0]find_sum,find_sub;
    wire [6:0]product;
    wire c0,c1,c2;
    wire d0,d1,d2;
    wire [3:0]inv_b;
    wire [3:0]two_comp;
    wire cout_sum;
    wire cout_sub;
    wire c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13;
    wire p1,p2,p3,p4,p5,p6,p7;
    wire a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;
    wire r1,r2,r3,r4,r5;
    assign inv_b=~B;
    assign two_comp=inv_b+1;   
 always@(*)begin
case(op)
2'b00:RESULT={3'b000,cout_sum,find_sum};
2'b01:RESULT={3'b000,cout_sub,find_sub};
2'b10:RESULT={c13,p7,p6,p5,p4,p3,p2,p1};

default:RESULT=8'b00000000;
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

assign a=A[0]&B[0];
assign b=A[1]&B[0];
assign c=A[2]&B[0];
assign d=A[3]&B[0];
assign e=A[0]&B[1];
assign f=A[1]&B[1];
assign g=A[2]&B[1];
assign h=A[3]&B[1];
assign i=A[0]&B[2];
assign j=A[1]&B[2];
assign k=A[2]&B[2];
assign l=A[3]&B[2];
assign m=A[0]&B[3];
assign n=A[1]&B[3];
assign o=A[2]&B[3];
assign p=A[3]&B[3];
 
 fulladder fa9(a,1'b0,1'b0,p1,c3);
 fulladder fa10(b,e,c3,p2,c4);
 fulladder fa11(c,f,c4,r1,c5);
 fulladder fa12(r1,i,c5,p3,c6);
 fulladder fa13(d,g,c6,r2,c7);
 fulladder fa14(r2,j,c7,r3,c8);
 fulladder fa15(r3,m,c8,p4,c9);
 fulladder fa16(h,k,c9,r4,c10);
 fulladder fa17(r4,n,c10,p5,c11);
 fulladder fa18(l,o,c11,p6,c12);
 fulladder fa19(p,1'b0,c12,p7,c13);
 
endmodule

