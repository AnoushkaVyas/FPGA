module Ripple_Carry_Adder(in1,in2,cin,fadd,cout);
input [3:0] in1;
input [3:0] in2;
input cin;
output [3:0] fadd;
output [0:0] cout;
wire [3:0] addition;
wire c0,c1,c2,c3;

fa fa0(in1[0],in2[0],cin,addition[0],c0);
fa fa1(in1[1],in2[1],c0,addition[1],c1);
fa fa2(in1[2],in2[2],c1,addition[2],c2);
fa fa3(in1[3],in2[3],c2,addition[3],c3);

assign fadd=addition;
assign cout=c3;

endmodule
