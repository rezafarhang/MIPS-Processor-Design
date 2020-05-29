`timescale 1ns / 1ps


module Alu_control_unit_test;

	// Inputs
	reg [2:0] ALUopt;
	reg [5:0] func;

	// Outputs
	wire [2:0] ALUctr;

	// Instantiate the Unit Under Test (UUT)
	   Alu_control_unit uut (
		.ALUopt(ALUopt), 
		.func(func), 
		.ALUctr(ALUctr)
	);

	initial begin
	
		// Add stimulus here
		
		ALUopt = 3'b100;
		func = 6'b100000;

		#100;
        
		ALUopt = 3'b100;
		func = 6'b100010;

		#100;
		
		ALUopt = 3'b100;
		func = 6'b100101;

		#100;
		
		ALUopt = 3'b100;
		func = 6'b100100;

		#100;
		
		ALUopt = 3'b100;
		func = 6'b101010;

		#100;
		
		ALUopt = 3'b000;
		func = 6'b000000;

		#100;
		
		ALUopt = 3'b001;
		func = 6'b000000;

		#100;
		
		
		ALUopt = 3'b010;
		func = 6'b000000;

		#100;

	end
      
endmodule

