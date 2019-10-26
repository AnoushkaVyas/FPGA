module Comparator(a,b,l,g,eq);
input [31:0] a;
input [31:0] b;
output l,g,eq;
comp16 f_32(a[15:0], b[15:0],lt0,gt0, equ0);
comp16 s_32(a[31:16], b[31:16],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule
