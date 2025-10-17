.ORIG X3000

TRAP x23
LD R6, ASCII                            ; Load R6 with ASCII
LD R5, NEGASCII                         ; Load R5 with ASCII
ADD R1, R0, x0        
ADD R1, R1, R5
TRAP x23           
ADD R0, R0, R5
ADD R2, R0, R1
ADD R2, R2, R6
LEA R0, MESG
TRAP x22
ADD R0, R2, x0
TRAP x21
HALT

ASCII       .FILL       x30             ; mask to add to convert to ASCII
NEGASCII    .FILL       xFFD0           ; negated ASCII mask (-x30)
MESG        .STRINGZ    "The sum is: "  
            .END