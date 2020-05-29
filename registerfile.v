module reza_register (
  // this part of processor responsible for saving states,so need clock and reset 
  clock, 
  reset,
  // component input addresses to access to register bank for READ & WRITE operation
  registerAddressA, // register addrees for READ operation 
  registerAddressB, // register addrees for READ operation
  registerAddressC, // register addrees for WRITE operation
  writeData, // input data that store in register bank in WRITE operation
  writeEnable, //
  registerDataA, // value of register in READ operation
  registerDataB // value of register in READ operation
);

  // variables I/O assignment
  input clock;
  input reset;
  input [4:0] registerAddressA;
  input [4:0] registerAddressB;
  input [4:0] registerAddressC;
  input [31:0] writeData;
  input writeEnable;
  output reg [31:0]registerDataA;
  output reg [31:0] registerDataB;

  // register list declaration
  reg [31:0] registerBank [0:31];

  // initialize register bank list element for test
  initial
    begin   
      registerBank[0] = 32'h00000000;
      registerBank[1] = 32'd252; 
      registerBank[2] = 32'hb0;
    end

/*
  //initialize register bank list 
  initial
    begin
      registerBank[0] <= 32'h00000000;
      registerBank[1] <= 32'd252;
      registerBank[2] <= 32'hb0;
      registerBank[3] <= 32'h00000000;
      registerBank[4] <= 32'h00000000;
      registerBank[5] <= 32'h00000000;
      registerBank[6] <= 32'h00000000;
      registerBank[7] <= 32'h00000000;
      registerBank[8] <= 32'h00000000;
      registerBank[9] <= 32'h00000000;
      registerBank[10] <= 32'h00000000;
      registerBank[11] <= 32'h00000000;
      registerBank[12] <= 32'h00000000;
      registerBank[13] <= 32'h00000000;
      registerBank[14] <= 32'h00000000;
      registerBank[15] <= 32'h00000000;
      registerBank[16] <= 32'h00000000;
      registerBank[17] <= 32'h00000000;
      registerBank[18] <= 32'h00000000;
      registerBank[19] <= 32'h00000000;
      registerBank[20] <= 32'h00000000;
      registerBank[21] <= 32'h00000000;
      registerBank[22] <= 32'h00000000;
      registerBank[23] <= 32'h00000000;
      registerBank[24] <= 32'h00000000;
      registerBank[25] <= 32'h00000000;
      registerBank[26] <= 32'h00000000;
      registerBank[27] <= 32'h00000000;
      registerBank[28] <= 32'h00000000;
      registerBank[29] <= 32'h00000000; 
      registerBank[30] <= 32'h00000000;
      registerBank[31] <= 32'h00000000;
    end
*/

  // READ operation
  always @(negedge clock) //when clock trigger is in negetive edge execute block in below
    begin
       registerDataA <= registerBank[registerAddressA]; //assign registerDataA, value of register bank registerAddressA address
       registerDataB <= registerBank[registerAddressB]; //assign registerDataB, value of register bank registerAddressB address
    end

  //WRITE operation
  always @(posedge clock) //when clock trigger is in posetive edge execute block in below
    begin
      if(writeEnable == 1) // if write base is "1" condition is true and confirmed 
         begin
	    registerBank[registerAddressC] <= writeData; // assign value of register bank registerAddressC address, writeData
         end 
    end    
endmodule

