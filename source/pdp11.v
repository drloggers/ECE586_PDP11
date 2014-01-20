module pdp11;

  `include"config.v"
  
  
integer data_file;
integer scan_file,eof;

reg [7:0]character;
reg [15:0]instruction;

reg [15:0]dummy;

//Declaration of Register File & PSW 

reg [15:0]R[7:0];
reg [15:0]PSW;
reg [MWIDTH:0]mem[MSIZE:0];

`include"src.v"


initial
begin
  

  
    data_file=$fopen("input1.ascii","r");
    eof=$feof(data_file);
    
    while(!eof)
    begin
      
    scan_file=$fscanf(data_file,"%c%o\n",character,instruction);
    $display("character : %c instruction : %o",character,instruction);
    eof=$feof(data_file);
    
    if(character == "@")
      begin
        $display("%b",PC);
        R[PC]=instruction;
      end
      
    else
      begin
        dummy=src_data(instruction[11:9],instruction[8:6]);
    case(instruction[14:12])
      
      3'b000:
      begin
        if(instruction[11])
          $display("The Instruction is of Type Single Operand Instruction");
          
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
            
    end
    endcase
  end

    end
end


endmodule 