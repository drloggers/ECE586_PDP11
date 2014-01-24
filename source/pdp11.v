module pdp11;

  `include"config.v"
  
  
integer data_file;
integer scan_file,eof;
integer mem_fill_ptr;


reg [7:0]character;
reg [15:0]instruction;

reg [15:0]dummy;

//Declaration of Register File & PSW 

reg [15:0]R[7:0];
reg [15:0]PSW;
reg [MWIDTH:0]mem[MSIZE:0];

`include"read_word.v"
`include"write_word.v"
`include"double_operand.v"
`include"single_operand.v"
`include"branch.v"
`include"jump.v"


initial
begin
  
		

  
    data_file=$fopen("input.ascii","r");
    eof=$feof(data_file);
     mem_fill_ptr=0;
    
    while(!eof)
  begin
      
    scan_file=$fscanf(data_file,"%c%o\n",character,instruction);
    $display("character : %c instruction : %o",character,instruction);
    eof=$feof(data_file);
   
    
    if(character == "@")
      begin
        $display("%b",PC);
        mem_fill_ptr=instruction;
      end
      
    else
      begin
      {mem[mem_fill_ptr+1],mem[mem_fill_ptr]}=instruction;
      mem_fill_ptr=mem_fill_ptr+2;
    end
  end
  
    R[PC]=0; 
    instruction={mem[R[PC]+1],mem[R[PC]]};
    while(instruction!=0)
    begin
    instruction={mem[R[PC]+1],mem[R[PC]]};
    R[PC]=R[PC]+2;
    case(instruction[14:12])
      
      3'b000:
      begin
        if(instruction[11])
					begin
							if(instruction[11:9] == 3'b100)
							begin
									$display("The Instruction is JSR Instruction");
									if(JSR_instruction(instruction))
										$display("");$display("Invalid Instruction");
							end
					else begin
          $display("The Instruction is of Type Single Operand Instruction");
          if(single_operand(instruction))
						$display("Invalid Instruction");
					end
					end
        else
          begin
          $display("The instruction is of Type Condition Branch Instruction OR Zero Operand");
          if(Branch_instruction(instruction))
						$display("Invalid Instruction");
        end
      end
      
      3'b111:
      begin
        $display("The instruction is of Type 1 & 1/2 Operand Instruction");
      end
      
      default:
      begin
      $display("The instruction is of Type Double Operand Instruction");
      //Call function that takes care of these type of instructions
      if(double_operand(instruction))
        $display("Invalid Instruction");
            
    	end
    endcase
    end
end
endmodule 