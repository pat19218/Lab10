module testbench();

reg clk = 0;
reg reset = 0;
reg ena_load_counter = 0;
reg loadCounter = 0;
reg enabledCounter = 0;
reg enabled_fetch = 0;
reg dato = 0;
reg [11:0]data;

output wire[7:0]Program_byte;
output wire[3:0]instruccion;
output wire[3:0]operando;



preparacion part1(clk, reset,
								  loadCounter, ena_load_counter,
									enabledCounter,  enabled_fetch,
									dato,
									Program_byte, instruccion, operando );





always@(*)begin
	#1 clk = ~clk;
end
always@(*)begin
	#1 clk = ~clk;
end
initial
	#100 $finish;

initial begin
	$dumpfile("Paquete_tb.vcd");
	$dumpvars(0, testbench);
	end
endmodule
