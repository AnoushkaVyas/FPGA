module comp8(a,b,l,g,eq);
input [7:0] a;
input [7:0] b;
output l,g,eq;
comp4 f_8(a[3:0], b[3:0],lt0,gt0, equ0);
comp4 s_8(a[7:4], b[7:4],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule
