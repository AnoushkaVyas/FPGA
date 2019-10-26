module fa(a, b, c,s, c_out);
input a,b,c;
output s,c_out;
ha first(a,b,c1,s1);
ha second(s1,c,c2,s2);
assign s=s2;
assign c_out= c1 | c2;
endmodule

