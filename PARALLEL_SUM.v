module parallel_add(partial_pagerank[9:0], enable[9:0],done_parrallel_division,pagerank,clk,reset);
input clk,reset;
input [31:0] partial_pagerank[9:0];
input [31:0] enable[9:0];
input [0:0] done_parrallel_division;
output [31:0] pagerank;

Adder_32 first(partial_pagerank[0], partial_pagerank[1], 0, sum_1, c_out_1);
Adder_32 second(partial_pagerank[2], partial_pagerank[3], 0, sum_2, c_out_2);
Adder_32 third(partial_pagerank[4], partial_pagerank[5], 0, sum_3, c_out_3);
Adder_32 fourth(partial_pagerank[6], partial_pagerank[7], 0, sum_4, c_out_4);
Adder_32 fifth(partial_pagerank[8], partial_pagerank[9], 0, sum_5, c_out_5);
  
