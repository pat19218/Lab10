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

reg [7:0]mem[0:4095];	

initial begin
	$readmemb("memoria.list",mem);
end

assign data = mem[addres];

endmodule


//f.f.D
module fetch(input clk, input reset, 
	     input ena, 
	     input [7:0]d, 
	     output logic [3:0]instruccion,
	     output logic [3:0]operando );


	always @ (posedge clk, posedge reset)
		if (reset)
			operando <= 4'b0;
			instruccion <= 4'b0;
		else if (ena)
			instruccion <= d[7:4];
			operando <= d[3:0];			
endmodule

//preparacion de control
module preparacion(input clk, input reset, 
		   input logic load_counter, input logic ena_load_counter,
		   input logic enabled_ct, input logic enabled_fetch,
		   input [11:0]in_dato,
		   output logic [7:0]program_byte, output logic [3:0]intsr, output logic [3:0]oprnd);

	
	output wire [11:0]out_counter;
	
	counter co1(.clk(clk), .reset(reset), 
		    .load(ena_load_counter), .enabled(enabled_ct),
		    .d(in_dato), 
		    .q(out_counter) );



	
	wire [7:0]out_ROM;

	ROM r1(.addr(out_counter), .data(out_ROM) );
	


	output wire [3:0]fetch_instruccion;
	output wire [3:0]fetch_operando;

	fetch ftc(.clk(clk), .reset(reset),
		  .ena(enabled_fetch),
		  .d(out_ROM),
		  .instruccion(fetch_intruccion), .operando(fetch_operando) );

assign program_byte = out_ROM;
assign intsr = fetch_intruccion;
assign oprnd = fetch_operando;
	

endmodule











