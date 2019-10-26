/*
Module computes addition of 32 bit numbers input_1 ,input_2(and carry_in)
To find final sum concat carry bit(1 bit) and sum(31 bit) i.e. {carry,sum} (32 bit)
*/
module Adder_32(input_1,input_2,carry_in,sum,carry);

input [31:0] input_1;
input [31:0] input_2;
input [0:0] carry_in;
output [31:0] sum;
output [0:0] carry;

wire [31:0] addition;
wire c0,c1,c2,c3,c4,c5,c6,c7;

Ripple_Carry_Adder rca0(input_1[3:0],input_2[3:0],carry_in,addition[3:0],c0);
Ripple_Carry_Adder rca1(input_1[7:4],input_2[7:4],c0,addition[7:4],c1);
Ripple_Carry_Adder rca2(input_1[11:8],input_2[11:8],c1,addition[11:8],c2);
Ripple_Carry_Adder rca3(input_1[15:12],input_2[15:12],c2,addition[15:12],c3);
Ripple_Carry_Adder rca4(input_1[19:16],input_2[19:16],c3,addition[19:16],c4);
Ripple_Carry_Adder rca5(input_1[23:20],input_2[23:20],c4,addition[23:20],c5);
Ripple_Carry_Adder rca6(input_1[27:24],input_2[27:24],c5,addition[27:24],c6);
Ripple_Carry_Adder rca7(input_1[31:28],input_2[31:28],c6,addition[31:28],c7);

assign sum = addition;
assign carry =c7 ;

endmodule

