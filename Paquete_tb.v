module testbench();

reg clk = 0;
reg reset = 0;
reg load = 0;
reg enabled = 0;
reg [11:0]data;
output wire[11:0]q;





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
