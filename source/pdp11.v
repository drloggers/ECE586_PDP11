module pdp11;

`include"config.v"
  
  
integer data_file;
integer scan_file,eof;
integer mem_fill_ptr;
integer trace_file;
integer branch_file;

reg [8*256:0] memory_image;

reg [7:0]character;
reg [15:0]instruction;

reg [15:0]dummy;
reg done;

//Declaration of Register File & PSW 

reg [15:0]R[7:0];
reg [15:0]PSW;
reg [MWIDTH:0]mem[MSIZE:0];

`include"read_word.v"
`include"write_word.v"
`include"double_operand.v"
`include"single_operand.v"
`include"memop.v"


initial
begin
  
//Obtain memory image file from the command line 
if($value$plusargs("IMAGE=%s", memory_image)) 
    begin
      $display("Loading from Memory Image %0s",memory_image);
    end
else 
  begin
  $display("Error: Image Not Specified in Command Line. The syntax is: vsim -novopt pdp11 +IMAGE=<Trace To Be Run>");
  $display("Simulation Halted. Please spcecify a trace file to run.");
  $stop;
  end

 //Call to Memory Fill function. Reads specified file and copies in memory array  
    if(mem_fill(0))
      $display("Error reading memory image file");
    
//Create/Open file specified_name_trace.txt in write mode for writing trace to  
    trace_file=$fopen({memory_image,"_trace.txt"},"w");
    branch_file=$fopen({memory_image,"_branch.txt"},"w");

   done=0;
    
    while(done!=1)
    begin
      
      //Instruction Fetch
    instruction={mem_read(R[PC]+1,1),mem_read(R[PC],1)};
    R[PC]=R[PC]+2;
    
    //Instruction Decode+Execute beyond here
    if(instruction==HALT)
      done=1;
      
      
    case(instruction[14:12])
      
      3'b000:
      begin
        if(instruction[11])
					begin
          $display("The Instruction is of Type Single Operand Instruction");
          if(single_operand(instruction))
						$display("Invalid Instruction");
					end
        else
          begin
          $display("The instruction is of Type Condition Branch Instruction OR Zero Operand");
          
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