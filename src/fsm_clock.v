module FSM_clock
(
	reset,
	CLOCK_50,
	C025Hz,
	C05Hz,
	C1Hz,
	C2Hz
);

input wire reset;
input wire CLOCK_50;


output reg C025Hz;
output reg C05Hz;
output C1Hz;
output C2Hz;

reg [27:0] r_C025Hz;
reg [27:0] r_C05Hz;
reg [27:0] r_C1Hz;
reg [27:0] r_C2Hz;

always@(posedge CLOCK_50) begin



end	

endmodule	