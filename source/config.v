// Parameters

//Parameters of PSW
parameter CARRY=0,
          OVERFLOW=1,
          ZERO=2,
          NEGATIVE=3,
          TRAP=4;
          
parameter PC=7,
          SP=6;
 
 //Memory Parameters         
parameter MWIDTH=7,
          MSIZE=(64*1024)-1;          
          
          
//Parameters of MODE 

parameter REGISTER               = 3'b000,
          REGISTER_DEFERRED      = 3'b001,
          AUTOINCREMENT          = 3'b010,
          AUTOINCREMENT_DEFERRED = 3'b011,
          AUTODECREMENT          = 3'b100,
          AUTODECREMENT_DEFERRED = 3'b101,
          INDEX                  = 3'b110,
          INDEX_DEFERRED         = 3'b111;
                
                
//Parameters of Double Operand Instructions & one and half operand instruction 
parameter MOV  = 4'b0001,
          MOVB = 4'b1001,
          CMP  = 4'b0010,
          CMPB = 4'b1010,
          BIT  = 4'b0011,
          BITB = 4'b1011,
          BIC  = 4'b0100,
          BICB = 4'b1100,
          BIS  = 4'b0101,
          BISB = 4'b1101,
          ADD  = 4'b0110,
          SUB  = 4'b1110;
          
// Parameters for branch instruction 

parameter BR  = 4'b0001,
          BNE = 4'b0010,
          BEQ = 4'b0011,
          BPL = 4'b1000,
          BMI = 4'b1001,
          BVC = 4'b1100,
          BVS = 4'b1101,
          BCC= 4'b1110,
          BLO = 4'b1111,
          BGE = 4'b0100,
          BLT = 4'b0101,
          BGT = 4'b0110,
          BLE = 4'b0111,
          BHI = 4'b1010,
          BLOS= 4'b1011;
          

// Parameters for Jump instruction
          
          

          
                
         
                        
