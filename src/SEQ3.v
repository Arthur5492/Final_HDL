/* **********************************************
* File Name: SEQ3.v
* Description: 4-bits sequency attribution 
* Author: vini, artur
* Creation Date: 28/06	/2024
* Revision: Version 1.0
*
* Input: 4-bits address
* Output: 4-bits registered saida
*	
********************************************** */	
module SEQ3(
    input [3:0] address,
    output reg [3:0] saida
);

always @(address) begin
    case (address)
				4'b0000: saida = 4'b0001;
				4'b0001: saida = 4'b1000;
				4'b0010: saida = 4'b0100;
				4'b0011: saida = 4'b1000;
				4'b0100: saida = 4'b0001;
				4'b0101: saida = 4'b0010;
				4'b0110: saida = 4'b0100;
				4'b0111: saida = 4'b1000;
				4'b1000: saida = 4'b0001;
				4'b1001: saida = 4'b0010;
				4'b1010: saida = 4'b1000;
				4'b1011: saida = 4'b0010;
				4'b1100: saida = 4'b0001;
				4'b1101: saida = 4'b1000;
				4'b1110: saida = 4'b0100;
				4'b1111: saida = 4'b0010;
                default: output_reg = 4'b0000;  // Default case to handle unexpected values
        endcase
end

endmodule