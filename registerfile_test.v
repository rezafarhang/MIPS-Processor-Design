`timescale 1ns / 1ps

module reza_test;

	// Inputs
	reg clock;
	reg reset;
	reg [4:0] registerAddressA;
	reg [4:0] registerAddressB;
	reg [4:0] registerAddressC;
	reg [31:0] writeData;
	reg writeEnable;

	// Outputs
	wire [31:0] registerDataA;
	wire [31:0] registerDataB;

	// Instantiate the Unit Under Test (UUT)
	reza_register uut (
		.clock(clock), 
		.reset(reset), 
		.registerAddressA(registerAddressA), 
		.registerAddressB(registerAddressB), 
		.registerAddressC(registerAddressC), 
		.writeData(writeData), 
		.writeEnable(writeEnable), 
		.registerDataA(registerDataA), 
		.registerDataB(registerDataB)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		registerAddressA = 0;
		registerAddressB = 0;
		registerAddressC = 0;
		writeData = 0;
		writeEnable = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	reset=0;
   registerAddressA=1;
   registerAddressB=0;
   registerAddressC=2;
   writeData=32'h00000000;
   writeEnable = 1;

	end
      
endmodule
