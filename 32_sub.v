module Sub(a,b,cin,diff,borrow);
input [31:0] a;
input [31:0] b;
output [31:0] diff;
output borrow;
input cin;
sub one(a[3:0],b[3:0],cin,diff[3:0],b1);
sub second(a[7:4],b[7:4],b1,diff[7:4],b2);
sub third(a[11:8],b[11:8],b2,diff[11:8],b3);
sub fourth(a[15:12],b[15:12],b3,diff[15:12],b4);
sub fifth(a[19:16],b[19:16],b4,diff[19:16],b5);
sub sixth(a[23:20],b[23:20],b5,diff[23:20],b6);
sub seventh(a[27:24],b[27:24],b6,diff[27:24],b7);
sub eigth(a[31:28],b[31:28],b7,diff[31:28],borrow);
endmodule

