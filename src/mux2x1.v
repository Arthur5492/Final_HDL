module mux2x1
(
	a,
	b,
	sel,
	q
);
	input wire a, b, sel;
	output reg q;
	
	always @(a or b or sel) begin
		if(sel == 1'b1)
			q <= a;
		else
			q <= b;
	
	end
  

endmodule