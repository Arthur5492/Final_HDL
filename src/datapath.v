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
	output reg [P_HEX-1:0] hex0,hex1,hex2,hex3,hex4,hex5;
	output reg [P_LEDS-1:0] leds;
	
	//Output Status
	output wire end_FPGA, end_User, end_time;
	output wire win,match;
	
	
//LIGAR NO DEC7SEG
wire [3:0] w_tempo;
counter_time U0_CT
(
	.CLKT(CLOCK_50), 
	.R(R2), //Reset
	.E(E2),	//Enable
	.TEMPO(w_tempo), //Actual tempo value
	.end_time(end_time) // end time flag

);

endmodule
