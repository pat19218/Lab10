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
module memoria_ROM (input wire [11:0]addres, output wire [7:0]data);

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
	     output reg [3:0]instruccion,
	     output reg [3:0]operando);


	always @ (posedge clk, posedge reset)begin

		if (reset)
			begin
				operando <= 4'b0;
				instruccion <= 4'b0;
			end
		else if (ena)
			begin
				instruccion <= d[7:4];
				operando <= d[3:0];
			end
	end
endmodule
