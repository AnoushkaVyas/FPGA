module comp4(a,b,l,g,eq);
input [3:0] a;
input [3:0] b;
output l,g,eq;
comp_2 f_4(a[1:0], b[1:0],lt0,gt0, equ0);
comp_2 s_4(a[3:2], b[3:2],lt1,gt1, equ1);
assign l=(lt0 | lt1) && (~gt1);
assign g=(gt0 | gt1) && (~lt1);
assign eq=equ0 && equ1;
endmodule
