// This function handles Branch instruction

function Branch_instruction;
  input [15:0]instruction;
  
  
  begin
    Branch_instruction=0;
    
    case({instruction[15],instruction[10:8]})
      
      BR: 
      R[PC] = R[PC]+(2*instruction[7:0]);
      
      BNE:
      if(!PSW[ZERO])
            begin
              R[PC]= R[PC]+(instruction[7:0]*2);
            end
        
        BEQ:
        if(PSW[PSW[ZERO]])
        begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
        end
        
        BPL:
        if(!PSW[NEGATIVE])
          begin
            R[PC]= (R[PC]+(instruction[7:0]*2));
          end
          
          BMI:
          if(PSW[NEGATIVE])
          begin
            R[PC]= (R[PC]+(instruction[7:0]*2));
            PSW[PSW[NEGATIVE]] = 0;
          end
          
          BVC:
          if(!PSW[OVERFLOW])
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BVS:
          if(PSW[OVERFLOW])
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BCC:
          if(!PSW[CARRY])
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
          
          BLO:
          if(PSW[CARRY])
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BGE:
          if(!(PSW[NEGATIVE] || PSW[OVERFLOW]))
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BLT:
          if(PSW[NEGATIVE] || PSW[OVERFLOW])
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BGT:
          if(!(PSW[ZERO] || (PSW[NEGATIVE] ^ PSW[OVERFLOW])))
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BLE:
         if(PSW[ZERO] || (PSW[NEGATIVE] ^ PSW[OVERFLOW]))
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          BHI:
          if(!(PSW[CARRY] && PSW[ZERO]))
             begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
             end
            
          BLOS:
          if(PSW[CARRY]&&PSW[ZERO])
            begin
              R[PC]= (R[PC]+(instruction[7:0]*2));
            end
            
          CLC:
          PSW[CARRY] = 1'b0;
          
          CLV:
          PSW[OVERFLOW] = 1'b0;
          
          CLZ:
          PSW[ZERO] = 1'b0;
          
          CLN:
          PSW[NEGATIVE] = 1'b0;
          
          SEC:
          PSW[CARRY] = 1'b1;
          
          SEV:
          PSW[OVERFLOW] = 1'b1;
        
          SEZ:
          PSW[ZERO] = 1'b1;
          
          SEN:
          PSW[NEGATIVE] = 1'b1;
            
      endcase
     end
  endfunction    