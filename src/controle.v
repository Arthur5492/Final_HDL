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

module controle
(
	CLOCK,
	enter,
	reset,
	end_FPGA,
	end_User,
	end_time,
	win,
	match,
	R1,R2,
	E1,E2,E3,E4,
	SEL
);
input CLOCK;
input enter;
input reset;
input end_FPGA;
input end_User;
input end_time;
input win;
input match;
	
output R1,R2;
output E1,E2,E3,E4;
output SEL;
	
reg [2:0] state, next_state;
		
always@(posedge CLOCK, posedge reset)
begin	
	if(reset)
		state <= Init;
	else 
		state <= next_state;
end
	
always@(state or enter or reset)
begin	
	case(state)
		Init: 
			begin
			R1=1'b1;
			R2=1'b1;
			E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
			SEL=1'b0;
			next_state = Setup;
			end
		Setup:
			begin
				R1=1'b0;R2=1'b0;
				E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
				E1 = 1'b1;
				while(enter!=1)
					;
					next_state = Play_FPGA;
			end
		Play_FPGA:
			begin
				E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
				E3=1'b1;
				next_state = Play_User;
			end
		Play_User:
			begin
				E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
				E2=1'b1;
				if(end_time)
					next_state = Result;
				else if(end_User)
					next_state = Check;
			end
		Check:
			begin
				E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
				E4=1'b1;
				/*if(correspondencia)
					next_state = Next_Round;
				else if(no correspondencia)
					next_state = Result;
			end*/
		Next_Round:
			begin
			E1=1'b0;E2=1'b0;E3=1'b0;E4=1'b0;//Reset
			R2 = 1'b1;
			if(win)
				next_state = result;
			end
			
		endcase
	end
	
endmodule