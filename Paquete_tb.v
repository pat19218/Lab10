module testbench();

reg clk = 0;
reg reset = 0;
reg ena_load_counter = 0;
reg loadCounter = 0;
reg enabledCounter = 0;
reg enabled_fetch = 0;
reg [11:0]dato;

output wire[7:0]Program_byte;
output wire[3:0]instruccion;
output wire[3:0]operando;



preparacion part1(clk, reset,
								  loadCounter, ena_load_counter,
									enabledCounter,  enabled_fetch,
									dato,
									Program_byte, instruccion, operando );

initial begin
	$display(" ");
	$display(" LOAD COUNTER    | Program byte  |   Instruccion   |  Operando  |");
	$display("----------------|---------------|-----------------|------------|");
	$monitor("%b               |  %b     |   %b          |    %b    |", loadCounter, Program_byte, instruccion, operando);

	reset = 1; #1 reset = 0; #1 dato = 12'b000011100000;
	#1 enabledCounter = 1;
	#1 ena_load_counter = 1; #2 ena_load_counter = 0;
	#1 enabled_fetch = 1;
	#2 reset = 1; #1 reset = 0;
	#1 dato = 12'b000000111000; #1 ena_load_counter = 1; #2 ena_load_counter = 0;
end


always@(*)begin
	#1 clk = ~clk;
end
always@(*)begin
	#1 clk = ~clk;
end
initial
	#20 $finish;

initial begin
	$dumpfile("Paquete_tb.vcd");
	$dumpvars(0, testbench);
	end
endmodule
