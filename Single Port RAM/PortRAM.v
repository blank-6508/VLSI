
module PortRAM(data_in , ram_address,write_enable,clk,data_out);

	input [7:0]data_in;
	input [5:0] ram_address;
	input write_enable;
	input clk;
	output [7:0]data_out;

	reg [7:0] ram_memory[63:0]; // a 64 byte ( 64*8 bit)  RAM  
	reg [5:0] address_register;

	always @(posedge clk) begin
	
		if (write_enable)  // write operation
		  ram_memory[ram_address] <= data_in;
		
		else 
		  address_register <= ram_address;
	end

	assign data_out = ram_memory[address_register];

endmodule
