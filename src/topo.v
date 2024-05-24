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
	CLOCK_50,
	KEY,
	SW,
	LEDR,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5
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
	
	always @(posedge CLOCK_50) LEDR = 0;
	
endmodule