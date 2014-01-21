//This function handles instruction of type Double Operand 

function single_operand;
  input[15:0]instruction;

	begin
		single_operand = 0;
			case(instruction[10:6])
				SWAB:
				begin
			
				end
				CLR:
				begin
					if(write_word(instruction[5:3],instruction[2:0],0))
						$display("Error during CLR instruction");
				end
				COM:
				begin
					if(write_word(instruction[5:3],instruction[2:0],!read_word(instruction[5:3],instruction[2:0])))
						$display("Error during COM instruction");
				end
					INC:
				begin
					if(write_word(instruction[5:3],instruction[2:0],read_word(instruction[5:3],instruction[2:0])+1))
						$display("Error during COM instruction");
				end

					DEC:
				begin
					if(write_word(instruction[5:3],instruction[2:0],read_word(instruction[5:3],instruction[2:0])-1))
						$display("Error during COM instruction");
				end

					NEG:
				begin
					if(write_word(instruction[5:3],instruction[2:0],-(read_word(instruction[5:3],instruction[2:0]))))
						$display("Error during COM instruction");
				end

					ADC:
				begin
					if(write_word(instruction[5:3],instruction[2:0],read_word(instruction[5:3],instruction[2:0])+PSW[CARRY]))
						$display("Error during COM instruction");
				end

					SBC:
				begin
					if(write_word(instruction[5:3],instruction[2:0],read_word(instruction[5:3],instruction[2:0])-PSW[CARRY]))
						$display("Error during COM instruction");
				end

					TST:
				begin
					//if(write_word(instruction[5:3],instruction[2:0],read_word(instruction[5:3],instruction[2:0])))
					//	$display("Error during COM instruction");
				end

          ROR:
				begin
			
				end

					ROL:
				begin
			
				end

				  ASR:
				begin
			
				end

					ASL:
				begin
			
				end

					MARK:		// byte variant of this has different functionality, take note
				begin
			
				end

					MFPI:
				begin
			
				end

					MTPI:
				begin
			
				end

					SXT:
				begin
			
				end
				default:
						single_operand = 1;

			endcase

	end
endfunction
