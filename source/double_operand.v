//This function handles instruction of type Double Operand 

function double_operand;
  input[15:0]instruction;
  reg status;

begin
  double_operand=0;
  case(instruction[15:12])
          MOV:
          begin
            if(dst_word(instruction[5:3],instruction[2:0],src_word(instruction[11:9],instruction[8:6])))
              $display("Error during MOV Instruction");
          end
          
          MOVB:
          begin
          end 
          CMP:
          begin
          end
          CMPB:
          begin
          end
          BIT:
          begin
          end
          BITB:
          begin
          end
          BIC:
          begin
          end
          BICB:
          begin
          end
          BIS:
          begin
          end
          BISB:
          begin
          end
          ADD:
          begin 
          end
          SUB:
          begin
          end
          default:
          begin
            //Error- Invalid Instruction
            double_operand=1;
          end
  endcase
  
  
end
endfunction