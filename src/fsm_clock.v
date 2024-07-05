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
output reg C1Hz;
output reg C2Hz;

reg [27:0] r_C025Hz;
reg [27:0] r_C05Hz;
reg [27:0] r_C1Hz;
reg [27:0] r_C2Hz;


//C0.25Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C025Hz <= 1'b0;
		r_C025Hz <= 28'h0000000;
	end
	else 
	begin
		r_C025Hz <= r_C025Hz + 1;
		if (r_C025Hz == 28'h5F5E100)
		begin
			r_C025Hz <= 28'h0000000;
			C025Hz =~ C025Hz;
		end
	end
end	

//C0.5Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C05Hz <= 1'b0;
		r_C05Hz <= 28'h0000000;
	end
	else 
	begin
		r_C05Hz <= r_C05Hz + 1;
		if (C05Hz == 28'h2FAF080)
		begin
			r_C05Hz <= 28'h0000000;
			C05Hz <= ~r_C05Hz;
		end
	end
end

//C1Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C1Hz <= 1'b0;
		r_C1Hz <= 28'h0000000;
	end
	else 
	begin
		r_C1Hz <= r_C1Hz + 1;
		if (r_C1Hz == 28'h017D783F)
		begin
			r_C1Hz <= 28'h0000000;
			C1Hz <= ~C1Hz;
		end
	end
end

//C2Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C2Hz <= 1'b0;
		r_C2Hz <= 28'h0000000;
	end
	else 
	begin
		r_C2Hz <= r_C2Hz + 1;
		if (r_C2Hz == 28'h0BEBC1F)
		begin
			r_C2Hz <= 28'h0000000;
			C2Hz <= ~C2Hz;
		end
	end
end





endmodule	