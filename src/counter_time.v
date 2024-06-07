/* **********************************************
* File Name: counter_time.v
* Description: 
* Author: Arthur Rodrigues - 22102053, Vinicius 
* Creation Date: 07/06/2024
* Revision: Version 1.0
*
* Input: 
* Output: 
*	
********************************************** */

module counter_time
(
	CLKT, 
	R, //Reset
	E,	//Enable
	TEMPO, //Actual tempo value
	end_time // end time flag

);

input wire CLKT, R, E;

output reg[3:0] TEMPO;
output reg end_time;

always @(posedge CLKT, posedge R)
begin

	if(R == 1'b1) begin
		TEMPO <=4'b0000;
		end_time <=1'b0;
	end

	else begin
		if(E == 1'b1) begin
			end_time <= 1'b0;
			TEMPO <= TEMPO + 1'b1;
			if (TEMPO == 4'b1001) begin
				TEMPO <= 4'b0;
				end_time <= 1'b1;
			end
		end
			
	end

end


endmodule