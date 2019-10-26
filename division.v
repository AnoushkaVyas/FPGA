/* Division of page rank by the out degree of a node */
/* page_rank is page rank value, out_deg is outdegree */

module divison(page_rank,out_deg,clk,reset,quotient,done);
input [31:0] page_rank,out_deg;
input clk,reset;
output reg [31:0] quotient;
output reg done=0;

/* Temporary variables for quotient (q), page_rank (reg_a), out_deg (reg_b), state register used to indicate whether computing or waiting for next input */

reg state; 
reg [31:0] q,r;
reg [31:0] reg_a, reg_b;

/* l,g, eq represent less than, greater than , equal to , diff is subtraction result, borrow is the borrow output of subtraction */

wire [31:0] sum,diff;
parameter s_wait=1'b0, first=1'b1;
Comparator comp(r,reg_b,l,g,eq);
Sub subtract(r,reg_b,32'b1,diff,borrow);
Adder_32 add(q,32'b1,32'b0,sum,carry);

/* c_out is carry output, Sum is the addition result, ans is concatenation of c_out and Sum */

always @(posedge clk, negedge reset)
begin
	state <= s_wait;
	if(!reset)
	begin
		quotient<=0;
		
	end
	else
	begin
		case(state)
		s_wait: begin
		reg_a <= page_rank;  
		reg_b <= out_deg;
		state<=first;
		q <= 0;
		r <= page_rank;
		end
		first: begin
		if(g || eq)
		begin
			q<=sum;
			r<=diff;
			state <= first;
		end
		if(l)
		begin	
		
			state <=s_wait;
			quotient <= q;	
			done = 1;
		end
		end
		endcase
	end
end
endmodule
