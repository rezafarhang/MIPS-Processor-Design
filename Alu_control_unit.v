`timescale 1ns / 1ps

module Alu_control_unit(
ALUop, // ALU opcode
func, //function
ALUctr //ALU control
);

// variables I/O assignment
output reg[2:0] ALUctr;
input [2:0] ALUop;  
input [5:0] func;

//evaluate ALU control
always @*
   begin
    //R type ALU control Evaluation	
    if (ALUop == 100 && func == 100000)
        ALUctr <= 3'b000;
    else if (ALUop == 100 && func == 100010)
        ALUctr <= 3'b001;
    else if (ALUop == 100 && func == 100101)
        ALUctr <= 3'b010;
    else if (ALUop == 100 && func == 100100)
        ALUctr <= 3'b110;
    else if (ALUop == 100 && func == 101010)
        ALUctr <= 3'b111;
    //I type ALU control Evaluation
    else
    ALUctr <= ALUop;
   end

endmodule