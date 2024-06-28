module reg_universal
#(parameter size = 2)
(
	clk,
	r,
	e,
	data,
	q,
);



input wire clk;
input wire r;
input wire e;
input wire [size-1:0] data;

output reg [size-1:0] q;
	
always@(posedge clk, posedge r)begin

	if(r == 1'b1)begin
		q <= 1'b0;
	end
	else begin
		if(e == 1'b1)begin
			q <= data;
			end
	end

end

endmodule
	
	