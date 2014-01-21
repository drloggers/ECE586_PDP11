//This function handles instruction of type Double Operand 

function single_operand;
  input[15:0]instruction;
	reg [15:0]result;

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
					PSW[CARRY] = 0;
					PSW[OVERFLOW] = 0;
          PSW[ZERO] = 1;
          PSW[NEGATIVE] = 0;
				end
				COM:
				begin
					//$display("%b",~read_word(instruction[5:3],instruction[2:0]));
					result = ~read_word(instruction[5:3],instruction[2:0]);
					if(write_word(instruction[5:3],instruction[2:0],result))
						$display("Error during COM instruction");

					if(result == 0)
						PSW[ZERO] = 1;
					else 
						PSW[ZERO] = 0;

					if(result[15] == 1)
          	PSW[NEGATIVE] = 1;
					else
						PSW[NEGATIVE] = 0;

						PSW[OVERFLOW] = 0;
						PSW[CARRY] = 1;
				end

				end
					INC:
				begin
					$display("%b :::::::::: %o",read_word(instruction[5:3],instruction[2:0]),15'o77777);
					result = read_word(instruction[5:3],instruction[2:0]);
					if(write_word(instruction[5:3],instruction[2:0],result+1))
						$display("Error during COM instruction");

					if((result+1) == 0)
						PSW[ZERO] = 1;
					else 
						PSW[ZERO] = 0;

					if(result == 15'o077777)
						PSW[OVERFLOW] = 1;
					else
						PSW[OVERFLOW] = 0;

					if(result[15] == 1)
          	PSW[NEGATIVE] = 1;
					else
						PSW[NEGATIVE] = 0;

				end

					DEC:
				begin
					$display("%b",~read_word(instruction[5:3],instruction[2:0]));
					result = read_word(instruction[5:3],instruction[2:0]);
					if(write_word(instruction[5:3],instruction[2:0],result-1))
						$display("Error during COM instruction");

					if((result-1) == 0)
						PSW[ZERO] = 1;
					else 
						PSW[ZERO] = 0;

					if(result == 15'o100000)
						PSW[CARRY] = 1;
					else
						PSW[CARRY] = 0;

					if(result[15] == 1)
          	PSW[NEGATIVE] = 1;
					else
						PSW[NEGATIVE] = 0;
				end

					NEG:
				begin
					$display("%b",~read_word(instruction[5:3],instruction[2:0]));
					result = -(read_word(instruction[5:3],instruction[2:0]));
					if(write_word(instruction[5:3],instruction[2:0],result)))
						$display("Error during COM instruction");
					
					if(result == 0)
					begin
						PSW[ZERO] = 1;
						PSW[CARRY] = 0;
					end
					else 
					begin
						PSW[ZERO] = 0;
						PSW[CARRY] = 1;
					end				

					if(result[15] == 1)
          	PSW[NEGATIVE] = 1;
					else
						PSW[NEGATIVE] = 0;

					if(result == 15'o100000)
						PSW[OVERFLOW] = 1;
					else
						PSW[OVERFLOW] = 0;
				end

					ADC:
				begin
					result = read_word(instruction[5:3],instruction[2:0]);
					if(write_word(instruction[5:3],instruction[2:0], result + PSW[CARRY]))
						$display("Error during COM instruction");

					if((result + PSW[CARRY]) == 0)
						PSW[ZERO] = 1;
					else 
						PSW[ZERO] = 0;

					if(result == 15'o177777 && PSW[CARRY] == 1)
						PSW[CARRY] = 1;
					else
						PSW[CARRY] = 0;

					if(result[15] == 1)
          	PSW[NEGATIVE] = 1;
					else
						PSW[NEGATIVE] = 0;

					if(result = 15'o0777777 && PSW[CARRY] = 1)
						PSW[OVERFLOW] = 1;
					else
						PSW[OVERFLOW] = 0; 
				end

					SBC:
				begin
						result = read_word(instruction[5:3],instruction[2:0]);
					if(write_word(instruction[5:3],instruction[2:0],result - PSW[CARRY]))
						$display("Error during COM instruction");

						if((result - PSW[CARRY]) == 0)
						PSW[ZERO] = 1;
					else 
						PSW[ZERO] = 0;

					if(result == 0 && PSW[CARRY] == 1)
						PSW[CARRY] = 0;
					else
						PSW[CARRY] = 1;

					if(result[15] == 1)
          	PSW[NEGATIVE] = 1;
					else
						PSW[NEGATIVE] = 0;

					if((result - PSW[CARRY]) == 15'o100000)
						PSW[OVERFLOW] = 1;
					else
						PSW[OVERFLOW] = 0;
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
