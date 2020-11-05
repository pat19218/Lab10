//couenter
module counter #(parameter N=12)
		(input logic clk, 
		 input logic reset,
		 input logic load,
		 input logic enabled,
		 input [11:0] d,
		 output logic [N-1:0]q);

always@(posedge clk, posedge reset)
	if(reset)
		q<=0;
	else if (load)
		q<=d;
	else if (enabled && !load)
		q<=q+1;

endmodule

//ROM
module ROM(input wire [11:0]addr, output logic [7:0]data);

reg[12:0] dato;

	always @(*) begin
		casez (addr)
			7'b??????0: dato = 13'b1000000001000;
			7'b00001?1: dato = 13'b0100000001000;
			7'b00000?1: dato = 13'b1000000001000;
			7'b00011?1: dato = 13'b1000000001000;
			7'b00010?1: dato = 13'b0100000001000;
			7'b0010??1: dato = 13'b0001001000010;
			7'b0011??1: dato = 13'b1001001100000;
			7'b0100??1: dato = 13'b0011010000010;
			7'b0101??1: dato = 13'b0011010000100;
			7'b0110??1: dato = 13'b1011010100000;
			7'b0111??1: dato = 13'b1000000111000;
			7'b1000?11: dato = 13'b0100000001000;
			7'b1000?01: dato = 13'b1000000001000;
			7'b1001?11: dato = 13'b1000000001000;
			7'b1001?01: dato = 13'b0100000001000;
			7'b1010??1: dato = 13'b0011011000010;
			7'b1011??1: dato = 13'b1011011100000;
			7'b1100??1: dato = 13'b0100000001000;
			7'b1101??1: dato = 13'b0000000001001;
			7'b1110??1: dato = 13'b0011100000010;
			7'b1111??1: dato = 13'b1011100100000;
			default: dato = 13'bxxxxxxxxxxxxx;			
		endcase
		assign data = dato;
end
endmodule

//f.f.D
module fetch(input clk, input reset, input ena, input [3:0]d, output logic [3:0]q);

	always @ (posedge clk, posedge reset)
		if (reset)
			q <= 4'b0;
		else if (ena)
			q <= d;			
endmodule

//preparacion de control
module preparacion(input clk, input reset, 
		   input logic load_counter, input logic ena_load_counter,
		   input logic enabled_ct, input logic enabled_fetch,
		   input [11:0]in_dato
		   output logic [7:0]program_byte, output logic [3:0]intsr, output logic [3:0]oprnd);

	
	output wire [11:0]out_counter;
	
	counter co1(.clk(clk), .reset(reset), 
		    .load(ena_load_counter), .enabled(enabled_ct),
		    .d(in_dato), 
		    .q(out_counter) );


	ROM(. );

end module











