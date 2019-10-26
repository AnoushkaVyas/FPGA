module parrallel_divison(first_index,last_index,partial_pagerank[9:0],enable[9:0],done_parrallel_division);

input [31:0] first_index;
input [31:0] last_index;
output [31:0] partial_pagerank[9:0];
output [0:0] done_parrallel_division=0;
output reg [9:0] enable;

wire [3:0] count;
wire [3:0] i=4'b0;
reg [9:0] done;
reg [0:0] tmp_done=1;


divison div_0(page_rank_0,out_deg_0,clk,reset,enable[0],partial_pagerank[0],done[0]);
divison div_1(page_rank_1,out_deg_1,clk,reset,enable[1],partial_pagerank[1],done[1]);
divison div_2(page_rank_2,out_deg_2,clk,reset,enable[2],partial_pagerank[2],done[2]);
divison div_3(page_rank_3,out_deg_3,clk,reset,enable[3],partial_pagerank[3],done[3]);
divison div_4(page_rank_4,out_deg_4,clk,reset,enable[4],partial_pagerank[4],done[4]);
divison div_5(page_rank_5,out_deg_5,clk,reset,enable[5],partial_pagerank[5],done[5]);
divison div_6(page_rank_6,out_deg_6,clk,reset,enable[6],partial_pagerank[6],done[6]);
divison div_7(page_rank_7,out_deg_7,clk,reset,enable[7],partial_pagerank[7],done[7]);
divison div_8(page_rank_8,out_deg_8,clk,reset,enable[8],partial_pagerank[8],done[8]);
divison div_9(page_rank_9,out_deg_9,clk,reset,enable[9],partial_pagerank[9],done[9]);
//call bram module here
//output of divison module is valid only if enable is one and done is one.

always @(posedge clk and negedge reset)
begin
	if(count<last_index-first_index-1)
	begin
		case(state)
		fetch:begin
			case(count)
			0:begin
				page_rank_0<=page_rank_bram;
				out_deg_0<=out_deg_bram;
				enable[0]<=1'b1;
				count<=count+1;
			end
			1:begin
				page_rank_1<=page_rank_bram;
				out_deg_1<=out_deg_bram;
				enable[1]<=1'b1;
				count<=count+1;
			end
			2:begin
				page_rank_2<=page_rank_bram;
				out_deg_2<=out_deg_bram;
				enable[2]<=1'b1;
				count<=count+1;
			end
			3:begin
				page_rank_3<=page_rank_bram;
				out_deg_3<=out_deg_bram;
				enable[3]<=1'b1;
				count<=count+1;
			end
			4:begin
				page_rank_4<=page_rank_bram;
				out_deg_4<=out_deg_bram;
				enable[4]<=1'b1;
				count<=count+1;
			end
			5:begin
				page_rank_5<=page_rank_bram;
				out_deg_5<=out_deg_bram;
				enable[5]<=1'b1;
				count<=count+1;
			end
			6:begin
				page_rank_6<=page_rank_bram;
				out_deg_6<=out_deg_bram;
				enable[6]<=1'b1;
				count<=count+1;
			end
			7:begin
				page_rank_7<=page_rank_bram;
				out_deg_7<=out_deg_bram;
				enable[7]<=1'b1;
				count<=count+1;
			end
			8:begin
				page_rank_8<=page_rank_bram;
				out_deg_8<=out_deg_bram;
				enable[8]<=1'b1;
				count<=count+1;
			end
			9:begin
				page_rank_9<=page_rank_bram;
				out_deg_9<=out_deg_bram;
				enable[9]<=1'b1;
				count<=count+1;
			end
		end
	end
	//how many times i need to fetch: make a count variable and fetch upto count becomes last_index-first_index-1
	//put simple if condition.
	//state machine with 2 states 1.fetch  3.output
	//1.FETCH : fetch pageranks and outdegree from BRAM and assign them to respective variables which are 
	//input to div_i.(???)
	//fetch pagerank and outdegree of BRAM	
	//if enable[i] of div_i is 1 and done_i is also one than we will consider that output as valid and 
	//store it in to register.and then call the sequential sum module.

	for(Integer i=0;i<10;i++)
	begin
		if(enable[i]==1)
		begin
			if(done[i]!=1)
			 begin
			 	tmp_done<=0;
			 end
		end
	end

end

assign done_parrallel_division=tmp_done;
endmodule
