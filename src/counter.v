//Falta terminar

module counter
#(parameter size = 4)
(
	clk,
	r,
	e,
	tc,
	data,
	count
);



input wire clk;
input wire r;
input wire e;
input wire [size-1:0] data;

output reg tc;
output reg [size-1:0] count;

always@(posedge r) begin
	
end

always@(posedge clk, posedge r)begin	
	if(r == 1'b1)begin
		count <= 4'b0000;
		tc <= 1'b0;
	end
	else begin
		if (e == 1'b1) begin
			tc <= 1'b0;
			count <= count + 1'b1;
		end
		else if(count == data) begin
			count <=1'b0;
			tc <= 1'b1;
		end
	end
end

endmodule