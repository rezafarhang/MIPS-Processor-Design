module control_unit(
// this part of processor responsible for saving states,so need reset 
reset,
opcode, // instruction opcode to recognize instruction
ALUop,RegDst,MemtoReg,Jump,Branch,MemRead,MemWrite,ALUSrc,RegWrite,ExtOp //decoding parts
);

// variables I/O assignment
input[5:0] opcode;  
input reset;  
output reg [2:0] ALUop;
output reg RegDst,MemtoReg,Jump,Branch,MemRead,MemWrite,ALUSrc,RegWrite,ExtOp;

// decoding operation
    always @(*)  
         begin
	     // reset operation	  
             if(reset == 1'b1)
               begin  
                  RegDst = 1'b0;  
                  MemtoReg= 1'b0;  
                  Jump = 1'b0;  
                  Branch = 1'b0;  
                  MemRead= 1'b0;  
                  MemWrite= 1'b0;  
                  ALUSrc= 1'b0;  
                  RegWrite= 1'b0;  
                  ExtOp= 1'b1;  
		  ALUop =3'b000;
               end  
            else
              begin
		// decoding operation based on opcode  
		case(opcode)   
                   6'b000000: // R_Type 
			begin   
                           RegDst = 1'b1;  
                           MemtoReg = 1'b0;  
                           Jump = 1'b0;  
                           Branch = 1'b0;  
                           MemRead= 1'b0;  
                           MemWrite = 1'b0;  
                           ALUSrc = 1'b0;  
                           RegWrite= 1'b1;  
                           ExtOp = 1'b0;// don't care  
			   ALUop =3'b100;					
                        end  
		   6'b000010: // Jump 
		        begin
                           RegDst= 1'b0;  
                           MemtoReg = 1'b0;   
                           Jump = 1'b1;  
                           Branch = 1'b0;  
                           MemRead = 1'b0;  
                           MemWrite = 1'b0;  
                           ALUSrc = 1'b0;  
                           RegWrite= 1'b0;  
                           ExtOp= 1'b0;  
			   ALUop =3'b000;
                        end 
                   6'b100011: // lw  
			 begin  
                            RegDst = 1'b0;  
                            MemtoReg= 1'b1;    
                            Jump = 1'b0;  
                            Branch = 1'b0;  
                            MemRead = 1'b1;  
                            MemWrite= 1'b0;  
                            ALUSrc = 1'b1;  
                            RegWrite = 1'b1;  
                            ExtOp= 1'b1; 
                            ALUop =3'b000;										 
                         end  
                   6'b101011: // sw 
			 begin   
                            RegDst = 1'b0; // don't care  
                            MemtoReg = 1'b0; // don't care  
                            Jump = 1'b0;  
                            Branch = 1'b0;  
                            MemRead = 1'b0;  
                            MemWrite= 1'b1;  
                            ALUSrc= 1'b1;  
                            RegWrite = 1'b0;  
                            ExtOp= 1'b1;  
			    ALUop =3'b000;
                         end  
                   6'b000100: // beq 
			 begin  
                            RegDst = 1'b0; // don't care  
                            MemtoReg = 1'b0; // don't care
                            Jump = 1'b0;  
                            Branch = 1'b1;  
                            MemRead= 1'b0;  
                            MemWrite = 1'b0;  
                            ALUSrc= 1'b0;  
                            RegWrite = 1'b0;  
                            ExtOp= 1'b0; 
                            ALUop =3'b001;									 
                         end  							
		   6'b001000: //ADDi
                         begin 
                            RegDst = 1'b0;  
                            MemtoReg = 1'b0;  
                            Jump = 1'b0;  
                            Branch = 1'b0;  
                            MemRead= 1'b0;  
                            MemWrite = 1'b0;  
                            ALUSrc= 1'b1;  
                            RegWrite= 1'b1;  
                            ExtOp= 1'b0;  
			    ALUop =3'b000;
                         end   
		   6'b001101: // ORi 
			 begin   
                            RegDst = 1'b0;  
                            MemtoReg = 1'b0;  
                            Jump = 1'b0;  
                            Branch = 1'b0;  
                            MemRead= 1'b0;  
                            MemWrite = 1'b0;  
                            ALUSrc= 1'b1;  
                            RegWrite= 1'b1;  
                            ExtOp= 1'b0;  
		            ALUop =3'b010;
                         end
	           6'b000011: // jal 
			 begin   
                            RegDst = 1'b0;  
                            MemtoReg = 1'b0;  
                            Jump = 1'b1;  
                            Branch = 1'b0;  
                            MemRead= 1'b0;  
                            MemWrite = 1'b0;  
                            ALUSrc= 1'b0;  
                            RegWrite= 1'b1;  
                            ExtOp= 1'b0;  
		            ALUop =3'b010;
                         end
      endcase  
      end  
 end  		  

endmodule
