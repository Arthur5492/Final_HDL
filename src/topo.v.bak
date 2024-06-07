/* **********************************************
* File Name: topo.v
* Description: 4-bits sequency attribution 
* Author: Arthur Rodrigues - 22102053, Vinicius 
* Creation Date: 24/05/2024
* Revision: Version 1.0
*
* Input: 
* Output: 
*	
********************************************** */

module topo

(
	CLOCK_50, KEY, SW,
	LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5
);

	//Parametroos locais
	localparam P_KEY 	= 4;
	localparam P_SW 	= 10;
	//Outputs
	localparam P_LEDR = 10;
	localparam P_HEX 	= 7;
	
	//Input Ports
	input CLOCK_50;
	input wire [P_KEY-1:0] KEY;
	input wire [P_SW-1:0] SW;
	
	//Output Port(s)
	output reg [P_LEDR-1:0] LEDR;
	output reg [P_HEX-1:0] HEX0;
	output reg [P_HEX-1:0] HEX1;
	output reg [P_HEX-1:0] HEX2;
	output reg [P_HEX-1:0] HEX3;
	output reg [P_HEX-1:0] HEX4;
	output reg [P_HEX-1:0] HEX5;
	
//always @(posedge CLOCK_50) LEDR = 0;

wire w_end_FPGA,w_end_User,w_endtime;
wire w_win, w_match; 
wire w_R1, w_R2;
wire w_E1, w_E2, w_E3, w_E4;
wire w_SEL;

Datapath U0_DP
(
	//Input Data
	.CLOCK_50(CLOCK_50),
	.KEY(KEY),
	.SWITCH(SW[9:2]),
	//Input Commands
	.R1(w_R1), .R2(w_R2),
	.E1(w_E1),.E2(w_E2),.E3(w_E3),.E4(w_E4),
	.SEL(w_SEL),
	//Output Data
	.hex0(),.hex1(),.hex2(),.hex3(),.hex4(),.hex5(),
	.leds(),
	//Output Status
	.end_FPGA(w_end_FPGA),.end_User(w_end_User),.end_time(w_endtime), 
	.win(w_win), .match(w_match)
);

Controle U1_FSM
(
	//INPUT DATA
	.CLOCK(CLOCK_50),
	.enter(SW[0]), .reset(SW[1]),
	//INPUT STATUS
	.end_FPGA(w_end_FPGA), .end_User(w_end_User), .end_time(w_endtime),
	.win(w_win), .match(w_match),
	//OUTPUT COMMANDS
	.R1(w_R1),.R2(w_R2),
	.E1(w_E1),.E2(w_E2),.E3(w_E3),.E4(w_E4),
	.SEL(w_SEL)
);

endmodule