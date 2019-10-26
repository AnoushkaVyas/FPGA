module divide_tb;
reg [31:0] page_rank;
reg [31:0] out_deg;
wire [31:0] quotient;
reg clk=0;
reg reset;
wire done;
divison DUT(.page_rank(page_rank),.out_deg(out_deg),.clk(clk),.reset(reset),.quotient(quotient),.done(done));
initial begin
page_rank=32'b0100;
out_deg=32'b0010;
reset=1;
#40
$display(quotient);
$display("done", done);
page_rank=32'b0100;
out_deg=32'b0001;
reset=1;
#40
$display(quotient);
$display("done", done);
page_rank=32'b0110;
out_deg=32'b0100;
reset=1;
#40
$display(quotient);
$display("done", done);
$finish;
end
always #1 clk=~clk;
endmodule

