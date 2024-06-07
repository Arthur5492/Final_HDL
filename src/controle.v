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
//Terminar a maquina de estado
module Controle
(
	CLOCK, enter, reset,
	end_FPGA, end_User, end_time,
	win, match,
	R1,R2,
	E1,E2,E3,E4,
	SEL
);
input wire CLOCK;
input wire enter;
input wire reset;
input wire end_FPGA;
input wire end_User;
input wire end_time;
input wire win;
input wire match;
	
output wire R1,R2;
output wire E1,E2,E3,E4;
output wire SEL;

assign R2 = reset;

endmodule
