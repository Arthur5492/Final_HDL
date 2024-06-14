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
	
output reg  R1,R2;
output reg  E1,E2,E3,E4;
output reg  SEL;

localparam N_STADOS = 3;
localparam [2:0] 
Init		  = 3'b000,
Setup 	  = 3'b001,
Play_FPGA  = 3'b010,
Play_User  = 3'b011,
Check		  = 3'b100,
Next_Round = 3'b101,		
Result 	  = 3'b110;

reg [N_STADOS-1:0] state, next_state;


//Processo sequencial
//Armazena estado ATUAL
always @(posedge CLOCK)
begin
	if(reset)
		state<= Init;
	else
		state<= next_state;		
end

//LOGICA COMBINACIONAL DOS ESTADOS
always @(end_FPGA or end_User or 
			end_time or win or match)
begin
	next_state = state;
	
	case(state)
		Init: 
			begin
			next_state = Setup;
			end
		Setup:
			if (enter == 1'b1) next_state = Play_FPGA;
		Play_FPGA:
			if (end_FPGA == 1'b1) next_state = Play_User;
		Play_User:
			begin
				if(end_time == 1'b1)
					next_state = Result;
				else if(end_User == 1'b1)
					next_state = Check;
			end
		Check:
			begin
				if(match == 1'b1)
					next_state = Next_Round;
				else
					next_state = Result;
			end
		Next_Round:
			if(win) next_state = Result;
		Result: next_state = Result;
		
		default: next_state = Init;

	endcase
end

always @(state) 
begin
	E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
	R1=1'b0;R2=1'b0;
	SEL=1'b0;
	
	case(state)
		Init:
			begin
				R1 = 1'b1; R2 = 1'b1;
			end
		Setup: begin E1 = 1'b1; end
		Play_FPGA:begin 	E3 = 1'b1; end
		Play_User:begin 	E2 = 1'b1;end
		Check:begin 		E4 = 1'b1;end
		Next_Round: begin R2 = 1'b1;end
		Result: begin		SEL = 1'b1;end
	endcase
end
endmodule

