/* **********************************************
* File Name: datapath.v
* Description: 
* Author: Arthur Rodrigues - 22102053, Vinicius 
* Creation Date: 24/05/2024
* Revision: Version 1.0
*
* Input: 
* Output: 
*	
********************************************** */
	  
module Datapath
(
	//Input Data
	CLOCK_50,
	KEY,
	SWITCH,
	//Input Commands
	R1,R2,
	E1,E2,E3,E4,
	SEL,
	//Output Data
	hex0,hex1,hex2,hex3,hex4,hex5,
	leds,
	//Output Status
	end_FPGA, end_User, end_time, 
	win, 
	match
);
	//LocalParam Inputs
	localparam P_KEY 	  = 4;
	localparam P_SWITCH = 8;
	//LocalParam Outputs
	localparam P_HEX 	= 7;
	localparam P_LEDS = 4;
	
	// Input Port(s)
	input CLOCK_50;
	input wire [P_KEY-1:0] KEY;
	input wire [P_SWITCH-1:0] SWITCH;	
	input wire R1,R2;
	input wire E1,E2,E3,E4;
	input wire SEL;
	
	// Output Port(s)
	output wire [P_HEX-1:0] hex0,hex1,hex2,hex3,hex4,hex5;
	output reg [P_LEDS-1:0] leds;
	
	//Output Status
	output wire end_FPGA, end_User, end_time;
	output wire win,match;
	
	
//LIGAR NO DEC7SEG
counter #(4)
U0_counter_time
(
    .clk(CLOCK_50),
	 .r(R2),
	 .e(E2),
	 .data(4'b1010),
	 .tc(end_time),
	 .count(TIME)
);

/////HEX5_INIT
wire w_win;
assign win = w_win;

wire [6:0] w_mux0_mux1;
mux2x1 MUX0
(
	.a(7'b1011_011),// 1 - U
	.b(7'b1000_111), // 0 - F
	.sel(w_win),
	.q(w_mux0_mux1)
);

mux2x1 MUX1
(
	.a(w_mux0_mux1), //1 - L
	.b(7'b0001_110), //0 
	.sel(SEL),
	.q(hex5)
);
/////HEX5_END


/////HEX4_INIT
wire [7:0] SETUP;
wire [6:0] w_dec0_mux3;
dec7seg DEC0
(
 .bcd_i({2'b00, SETUP[7:6]}),
 .seg_o(w_dec0_mux3)
);


wire [6:0] w_mux2_mux3;
mux2x1 MUX2
(
	.a(7'b1011_011), //1 - S
	.b(7'b1100_111), //0 - P
	.sel(w_win),
	.q(w_mux2_mux3)
);

mux2x1 MUX3
(
	.a(w_mux2_mux3), //1
	.b(w_dec0_mux3), //0
	.sel(SEL),
	.q(hex4)
);
/////HEX4_END

/////HEX3_INIT
wire [6:0] w_mux4_mux5;
mux2x1 MUX4
(
	.a(7'b1001_111), //1 - E
	.b(7'b1111_011), //0 - g
	.sel(w_win),
	.q(w_mux4_mux5)
);

mux2x1 MUX5
(
	.a(w_mux4_mux5), //1
	.b(7'b0001_111), //0 - t
	.sel(SEL),
	.q(hex3)
);
/////HEX3_END

/////HEX2_INIT
wire [6:0] w_dec1_mux7;
dec7seg DEC1
(
 .bcd_i(TIME),
 .seg_o(w_dec1_mux7)
);


wire [6:0] w_mux6_mux7;
mux2x1 MUX6
(
	.a(7'b1011_011), //1 - r
	.b(7'b1100_111), //0 - A
	.sel(w_win),
	.q(w_mux6_mux7)
);

mux2x1 MUX7
(
	.a(w_mux6_mux7), //1
	.b(w_dec1_mux7), //0
	.sel(SEL),
	.q(hex2)
);
///HEX2_END

/////HEX1_INIT
wire [7:0] POINTS;
wire [6:0] w_dec2_mux8;
dec7seg DEC2
(
 .bcd_i(POINTS[7:4]),
 .seg_o(w_dec2_mux8)
);


mux2x1 MUX8
(
	.a(w_dec2_mux8), //1
	.b(7'b1011_011), //0 - r
	.sel(SEL),
	.q(hex1)
);
/////HEX1_END

/////HEX0_INIT
wire [3:0] ROUND;
wire [6:0] w_dec3_mux9;
dec7seg DEC3
(
 .bcd_i(ROUND),
 .seg_o(w_dec3_mux9)
);

wire [6:0] w_dec4_mux9;
dec7seg DEC4
(
 .bcd_i(POINTS[3:0]),
 .seg_o(w_dec4_mux9)
);

mux2x1 MUX9
(
	.a(w_dec4_mux9), //1
	.b(w_dec3_mux9), //0 
	.sel(SEL),
	.q(hex0)
);
/////HEX0_END


endmodule
