`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:50:59 05/29/2020
// Design Name:   reza_Alu
// Module Name:   D:/ISE/Projects/SecondProject/reza_alu_test.v
// Project Name:  SecondProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reza_Alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Alu_unit_test;

	// Inputs
	reg clock;
	reg reset;
	reg [2:0] control;
	reg [31:0] dataA;
	reg [31:0] dataB;

	// Outputs
	wire [31:0] dataC;

	// Instantiate the Unit Under Test (UUT)
	Alu_unit uut (
		.clock(clock), 
		.reset(reset), 
		.control(control), 
		.dataA(dataA), 
		.dataB(dataB), 
		.dataC(dataC)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		control = 0;
		dataA = 0;
		dataB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		dataA=2;
		dataB=5;
		control = 3'b000;

		// Wait 100 ns for global reset to finish
		#100;
		
		dataA=2;
		dataB=5;
		control = 3'b001;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		dataA=2;
		dataB=5;
		control = 3'b010;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		dataA=2;
		dataB=5;
		control = 3'b110;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		dataA=2;
		dataB=5;
		control = 3'b111;

		// Wait 100 ns for global reset to finish
		#100;
	end
      
endmodule

