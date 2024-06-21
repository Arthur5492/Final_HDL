/*
	dec7seg.v
	Rodrigo pereira - 08/04/2024
	
	Decodificador Display 7 segmentos
	
   DECIMAL | BINARIO
	 0    - 7'b000_0001
    1    - 7'b100_1111
    2    - 7'b001_0010
    3    - 7'b000_0110
    4    - 7'b100_1100
    5    - 7'b010_0100
    6    - 7'b010_0000
    7    - 7'b000_1111
    8    - 7'b000_0000
    9    - 7'b000_0100	 
	 https://www.focuslk.com/design-of-bcd-to-7-segment-display-decoder-using-logic-gates/
*/

module dec7seg
(
    bcd_i,
    seg_o
);
     
   localparam BCD_SIZE = 4;
	localparam SEG_SIZE = 7;
	 
    input  wire [BCD_SIZE - 1:0] bcd_i;
    output reg  [SEG_SIZE - 1:0] seg_o;
 
    always @(bcd_i) begin
        case (bcd_i)
            4'h0 : seg_o = ~7'b011_1111;   
				4'h1 : seg_o = ~7'b000_0110;   
				4'h2 : seg_o = ~7'b101_1011;
				4'h3 : seg_o = ~7'b100_1111;
				4'h4 : seg_o = ~7'b110_0110;
				4'h5 : seg_o = ~7'b110_1101;
				4'h6 : seg_o = ~7'b111_1101;
				4'h7 : seg_o = ~7'b000_0111;
				4'h8 : seg_o = ~7'b111_1111;
				4'h9 : seg_o = ~7'b110_1111;
				4'hA : seg_o = ~7'b111_0111;
				4'hB : seg_o = ~7'b111_1100;
				4'hC : seg_o = ~7'b011_1001;
				4'hD : seg_o = ~7'b101_1110;
				4'hE : seg_o = ~7'b111_1001;
				4'hF : seg_o = ~7'b111_0001;
         default: seg_o = ~7'b100_0000;
        endcase
    end
    
endmodule