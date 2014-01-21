//Function to find MODE and SOURCE.
//This function returns 16 bit value from appropriate Source in given Mode 

function [15:0]read_word;
   input[2:0]mode;
  input[2:0]source;
  
  begin
    case(mode)
      REGISTER:
      begin
        read_word=R[source];
      end
      
      REGISTER_DEFERRED:
      begin
        read_word={mem[R[source]+1],mem[R[source]]};
      end
      
      AUTOINCREMENT:
      begin
        read_word={mem[R[source]+1],mem[R[source]]};
        R[source]=R[source]+2;
      end
      
      AUTOINCREMENT_DEFERRED:
      begin
        read_word=mem[{mem[R[source]+1],mem[R[source]]}];
        R[source]=R[source]+2;
      end
      
      AUTODECREMENT:
      begin
        R[source]=R[source]-2;
        read_word={mem[R[source]+1],mem[R[source]]};
      end
      
      AUTODECREMENT_DEFERRED:
      begin
        R[source]=R[source]-2;
       read_word={mem[R[source]+1],mem[R[source]]};
      end
      
      
      
      
      
    
    
    
    
    
      
  

    end
endfunction  