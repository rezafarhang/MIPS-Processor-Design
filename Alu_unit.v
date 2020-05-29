`timescale 1ns / 1ps

module Alu_unit(
// this part of processor responsible for saving states,so need clock and reset
clock,
reset,
control, // ALU control for recognize operations and operation types
// operation input datas 
dataA,
dataB,
// operation output data
dataC,
overflow //overflow flag
);

// variables I/O assignment
input clock;
input reset;
input [2:0] control;
input [31:0] dataA;
input [31:0] dataB;
output reg[31:0] dataC;
output reg[0:0] overflow;

// operation recognition
always @(control,dataA,dataB)
begin
    overflow = 0; // initial value
    case(control)
        0: // ALUctr = '000'
        begin
            dataC <= dataA + dataB; // ADD operation
	    //overflow conditions
            if (dataA > 0 && dataB > 0 && dataC < 0)
                overflow = 1; // overflow
            else if (dataA < 0 && dataB < 0 && dataC > 0)
                overflow = 1; // overflow
        end
        1: // ALUctr = '001'
        begin
            dataC <= dataA - dataB; // Subtract operation
	    //overflow conditions	
            if (dataA > 0 && dataB < 0 && dataC < 0)
                overflow = 1; // overflow
            else if (dataA < 0 && dataB > 0 && dataC > 0)
                overflow = 1; // overflow
        end
	// ALUctr = '010'
        2:dataC <= dataA | dataB; // OR operation
	// ALUctr = '110'
        6:dataC <= dataA & dataB; // AND operation
	// ALUctr = '111'
        7:
        begin
	    // smaller than operation
            if (dataA < dataB)
                dataC <= 1;
            else
                dataC <= 0;        
        end
    endcase
end

endmodule
