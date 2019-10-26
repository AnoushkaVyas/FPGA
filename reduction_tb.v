module Single_Reduction_tb;

reg [31:0] sum;
reg [31:0] page_rank;
reg [31:0] out_deg;
reg clk;
reg reset;
wire [31:0] new_sum;
wire done;

Single_Reduction DUT(.sum(sum),.page_rank(page_rank),.out_deg(out_deg),.clk(clk),.new_sum(new_sum),.done(done));
initial begin
	reset<=1;
	clk<=1;

	page_rank<=32'b110;
	out_deg<=32'b10;
	sum<=32'b110;
	#20
	$display("%d",page_rank);
	$display("%d",out_deg);
	$display("%d",sum);
	$display("%d",new_sum);
	$display("%d",done);


	page_rank<=32'b110;
	out_deg<=32'b10;
	sum<=32'b10;
	#20
	$display("%d",page_rank);
	$display("%d",out_deg);
	$display("%d",sum);
	$display("%d",new_sum);
	$display("%d",done);


	page_rank<=32'b11111;
	out_deg<=32'b1;
	sum<=32'b1111101000;
	#100
	$display("%d",page_rank);
	$display("%d",out_deg);
	$display("%d",sum);
	$display("%d",new_sum);
	$display("%d",done);

	page_rank<=32'b101010111101011101110;
	out_deg<=32'b110101101;
	sum<=32'b1101011111111110101;
	#10000
	$display("%d",page_rank);
	$display("%d",out_deg);
	$display("%d",sum);
	$display("%d",new_sum);
	$display("%d",done);


	$finish;
end

always #1 clk=~clk;

endmodule