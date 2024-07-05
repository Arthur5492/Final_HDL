module counter
#(parameter size = 4)
(
    clk,
	 r,
	 e,
	 data,
	 tc,
	 count
);

input wire clk;
input wire r;
input wire e;
input wire [size-1:0] data;
output reg tc;
output reg [size-1:0] count;

always @(posedge clk or posedge r) begin
    if (r == 1'b1) begin
        count <= {size{1'b0}}; 
        tc <= 1'b0;
    end
    else begin
		if (e == 1'b1) begin
        if (count == size) begin 
            count <= {size{1'b0}}; 
            tc <= 1'b1; 
        end
        else begin
            count <= count + 1'b1; 
            tc <= 1'b0;
        end
		end
    end
end


endmodule