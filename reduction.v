module Single_Reduction(sum,page_rank,out_deg,clk,reset,new_sum,done);

input [31:0] sum;
input [31:0] page_rank;
input [31:0] out_deg;
input clk;
input reset;
output reg [31:0] new_sum;
output reg [0:0] done;
reg [31:0] final_quotient;
reg [1:0] state;
reg [31:0] reg_page_rank, reg_out_deg, reg_sum;
parameter s_wait=2'b00, compute_quotient=2'b01,compute_sum=2'b10;
wire [31:0] quotient,temp_sum;
reg [0:0] valid;

divison div(reg_page_rank,reg_out_deg,clk,reset,quotient,done_prev);
Adder_32 add(sum,quotient,0,temp_sum,carry);

always @(posedge clk, negedge reset)
begin
	state <= s_wait;
	if(!reset)
	begin
		new_sum<=0;
		valid<=1;		
	end
	else
	begin
		case(state)	
		s_wait: begin
		reg_page_rank <= page_rank;  
		reg_out_deg <= out_deg;
		reg_sum<=sum;
		state<=compute_quotient;
		valid<=0;
//		$display("state=%d page_rank=%d outdegree=%d sum=%d",state,reg_page_rank,reg_out_deg,reg_sum);
		end
			

		compute_quotient: begin
		//calcuting pagerank/outdegree
		if(done_prev==1)
		begin
//			$display("quotient=%d",quotient);
			final_quotient<=quotient;
			state<=compute_sum;
			valid<=1;
//			new_sum<={carry,temp_sum};
//			done<=1;
		end
		else begin
			done<=done_prev;
		end
		end
		compute_sum: begin
			if(valid==1)
			begin
				new_sum<={carry,temp_sum};
				done<=1;
			end
		end
		endcase

	end
	/*$display(new_sum);*/
end
/*always @*
begin
	$display(new_sum);
	$display(done);
end
*/
endmodule