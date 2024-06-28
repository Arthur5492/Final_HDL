/* **********************************************
* File Name: counter_time.v
* Description: 
* Author: Arthur Rodrigues - 22102053, Vinicius 
* Creation Date: 28/06/2024
* Revision: Version 1.0
*
* Input: 
* Output: 
*	
********************************************** */

module counter_FPGA
#(SIZE = 4)(
CLKHZ,R, E,data,
end_FPGA,SEQFPGA //end_fpga = tc


);

input wire CLKHZ,R, E;
input wire [SIZE-1:0]data;

output reg [SIZE-1:0]SEQFPGA;
output reg end_FPGA;

always@(posedge CLKHZ or posedge R or posedge E or posedge data or posedge SEQFPGA)
begin
	if(R == 1'b1) 
	begin 
	SEQFPGA <= 4'b0000; 
	end_FPGA <=1'b0; 
	
	end
	
	
	else begin
		if(E == 1'b1) begin
		SEQFPGA <= SEQFPGA + 1'b1;
		end_FPGA <= 1'b0;
		
			if(SEQFPGA == data)begin 
		// ZERA CONTAGEM
			SEQFPGA <= 4'b0000; 
			end_FPGA <= 1'b1;
		
			end
			
			else begin
					end_FPGA <= 4'b0000;
			end
			
		
			end
	
		end
end

endmodule