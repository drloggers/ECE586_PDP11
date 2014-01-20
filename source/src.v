//Function to find MODE and SOURCE.
//This function returns 16 bit value from appropriate Source in given Mode 

function [15:0]src_data;
   input[2:0]mode;
  input[2:0]source;
  
  begin
    case(mode)
      3'b000:
      begin
        src_data=R[source];
      end
      
      3'b001:
      begin
        src_data={mem[R[source]+1],mem[R[source]]};
      end
      
      3'b010:
      begin
        src_data={mem[R[source]+1],mem[R[source]]};
        R[source]=R[source]+2;
      end
      
      3'b011:
      begin
        src_data=mem[{mem[R[source]+1],mem[R[source]]}];
        R[source]=R[source]+2;
      end
      
      3'b100:
      begin
        R[source]=R[source]-2;
        src_data={mem[R[source]+1],mem[R[source]]};
      end
      
      3'b101:
      begin
        R[source]=R[source]-2;
       src_data={mem[R[source]+1],mem[R[source]]};
      end
      
      3'b110:
      begin
         src_data= mem[R[source]+{mem[R[PC]+1],mem[R[PC]]}];
         R[PC]=R[PC]+2;
      end
      
      3'b111:
      begin
         src_data= mem[mem[R[source]+{mem[R[PC]+1],mem[R[PC]]}]];
         R[PC]=R[PC]+2;
      end
    endcase
    end
endfunction  