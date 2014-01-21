//Function to find MODE and destination.
//This function stores 16 bit value to appropriate destination in given Mode 

function write_word;
  input[2:0]mode;
  input[2:0]destination;
  input[15:0]data;
  
  begin
    write_word=0;
    case(mode)
      REGISTER:
      begin
        R[destination]=data;
      end
      
      REGISTER_DEFERRED:
      begin
        {mem[R[destination]+1],mem[R[destination]]}=data;
      end
      
      AUTOINCREMENT:
      begin
        {mem[R[destination]+1],mem[R[destination]]}=data;
        R[destination]=R[destination]+2;
      end
      
      AUTOINCREMENT_DEFERRED:
      begin
        mem[{mem[R[destination]+1],mem[R[destination]]}]=data;
        R[destination]=R[destination]+2;
      end
      
      AUTODECREMENT:
      begin
        R[destination]=R[destination]-2;
        {mem[R[destination]+1],mem[R[destination]]}=data;
      end
      
      AUTODECREMENT_DEFERRED:
      begin
        R[destination]=R[destination]-2;
       {mem[R[destination]+1],mem[R[destination]]}=data;
      end
      
      INDEX:
      begin
          mem[R[destination]+{mem[R[PC]+1],mem[R[PC]]}]=data;
         R[PC]=R[PC]+2;
      end
      
     INDEX_DEFERRED:
      begin
          mem[mem[R[destination]+{mem[R[PC]+1],mem[R[PC]]}]]=data;
         R[PC]=R[PC]+2;
      end
      
      default:
      begin
        //Error. 
        write_word=1;
      end
    endcase
    end
endfunction  