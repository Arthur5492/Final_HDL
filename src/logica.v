module logica
(
	REG_SetupLEVEL,
	ROUND,
	REG_SetupMAPA,
	POINTS
);

input wire [1:0] REG_SetupLEVEL;
input wire [3:0] ROUND;
input wire [1:0] REG_SetupMAPA;

output wire [7:0] POINTS;

assign POINTS = {REG_SetupLEVEL, ROUND};
 
endmodule