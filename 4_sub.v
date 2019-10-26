module sub(a,b,cin,diff,borrow);
input [3:0] a;
input [3:0] b;
output [3:0] diff;
input cin;
output borrow;
fa f(a[0], ~b[0],cin,diff[0], c1);
fa s(a[1], ~b[1],c1 ,diff[1], c2);
fa t(a[2], ~b[2],c2 ,diff[2], c3);
fa fi(a[3], ~b[3],c3 ,diff[3],borrow);
endmodule

