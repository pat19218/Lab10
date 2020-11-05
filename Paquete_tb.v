module testbench();

reg clk = 0;
reg reset = 1;
reg load = 0;
reg enabled = 0;
reg [11:0]data;
output wire[11:0]q;


counter c1(clk, reset, load, enabled, data, q);

initial begin
	#1 reset = 0;
	#5 enabled = 1;
	#5 data = 12'b000000111000;
	#1 load = 1; #1 load = 0; 
	#6 enabled = 0; data = 12'b000100110000;
	#5 enabled = 1;
	#4 load = 1; #4 load = 0;
	
end





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