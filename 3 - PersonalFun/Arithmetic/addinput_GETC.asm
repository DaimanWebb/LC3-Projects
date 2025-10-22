;-------------------------------------------------------------------------
;                               —
;=========================================================================
; ### Objective  —  TO TEST THE DATAMOVES + IN/OUT INSTRUCTIONS + ASCII — BINARY CONVERSION!
;
; ### High Level Description  —  PROMPTS THE USER TO INPUT 2 NUMBERS BETWEEN 0-9, ADDS THOSE NUMBERS TOGETHER, 
;                              AND DISPLAYS THE SUM USING THE STRING HELD IN MESG AT THE END OF THE PROGRAM
;=========================================================================
;-------------------------------------------------------------------------
; REGISTER CONVENTION
;-------------------------------------------------------------------------
; R0 — RESERVED FOR USER CHAR INPUT FROM 
;-------------------------------------------------------------------------
; R1 — FIRST NUMBER
;-------------------------------------------------------------------------
; R2 — SECOND NUMBER
;-------------------------------------------------------------------------
; R4 — THE SUM
;-------------------------------------------------------------------------
; R5 — x30 FOR HEX -> ASCII
;-------------------------------------------------------------------------
; R6 — -x30 FOR ASCII -> HEX
;-------------------------------------------------------------------------
; R7 — 
;-------------------------------------------------------------------------
;=========================================================================
; begin program
;=========================================================================
.ORIG x3000
;=========================================================================
;-------------------------------------------------------------------------
;   INIT REGISTERS R5, R6 TO ASCII & NEGASCII, RESPECTIVELY
;-------------------------------------------------------------------------
    LD R5, ASCII                            ;   Load R6 with ASCII
    LD R6, NEGASCII                         ;   Load R5 with NEGASCII
;=========================================================================
;-------------------------------------------------------------------------
;   DISPLAY PROMPT
;-------------------------------------------------------------------------
    LEA R0 PROMPT                           ;   LOAD R0 WITH ADDRESS ALIASED BY PROMPT
    TRAP x22                                ;   CALLS PUTS
;=========================================================================
;-------------------------------------------------------------------------
;   GET INPUT FROM USER
;-------------------------------------------------------------------------
    LD R0 NEWLINE                           ;   LOADS R0 WITH x0A, THE ASCII CODE FOR NEWLINE 
    TRAP x21                                ;   OUT - PRINTS THE NEWLINE
    LEA R0 NUM                              ;   LOAD R0 WITH ADDRESS ALIASED BY NUM
    TRAP x22                                ;   PRINTS "NUM: "
    TRAP x20                                ;   CALLS GETC
    TRAP x21                                ;   OUT - ECHOES INPUT BACK TO USER
    ADD R1, R0, x0                          ;   R1 <- R0 (SAVES FIRST CHAR IN R1)
    LD R0 NEWLINE                           ;   LOADS R0 WITH x0A, THE ASCII CODE FOR NEWLINE 
    TRAP x21                                ;   OUT - PRINTS THE NEWLINE
;-------------------------------------------------------------------------
;   GET INPUT FROM USER AGAIN =D=
;-------------------------------------------------------------------------
    LEA R0 NUM                              ;   LOAD R0 WITH ADDRESS ALIASED BY NUM
    TRAP x22                                ;   PRINTS "NUM: "
    TRAP x20                                ;   CALLS GETC
    TRAP x21                                ;   OUT - ECHOES INPUT BACK TO USER
    ADD R2, R0, x0                          ;   R2 <- R0 (SAVES FIRST CHAR IN R2)
    LD R0 NEWLINE                           ;   LOADS R0 WITH x0A, THE ASCII CODE FOR NEWLINE 
    TRAP x21                                ;   OUT - PRINTS THE NEWLINE
;-------------------------------------------------------------------------
;   ^^^ COULD BE SOLVE WITH A 2 ITERATION LOOP, BUT SINCE ONLY 2 INPUTS ARE NEEDED,
;   I JUST WROTE IT TWICE FOR SIMPLICITY'S SAKE ^^^
;=========================================================================
;-------------------------------------------------------------------------
;   OUTPUT NEWLINE
;-------------------------------------------------------------------------
    LD R0 NEWLINE                           ;   LOADS R0 WITH x0A, THE ASCII CODE FOR NEWLINE <- R0 (SAVES FIRST CHAR IN R1)
    TRAP x21                                ;   OUT - PRINTS THE NEWLINE
;=========================================================================
;-------------------------------------------------------------------------
;   COMPUTE & DISPLAY SUM
;-------------------------------------------------------------------------
;   1. CONVERT BOTH INPUTS FROM ASCII -> BINARY
;   2. PERFORM ARITHMETIC (SUMMATION)
;   3. CONVERT SUM FROM BINARY -> ASCII
;-------------------------------------------------------------------------
    ADD R1, R1, R6                          ;   R1 <- R1 - R6 (MINUS_HEX_30)  
    ADD R2, R2, R6                          ;   R2 <- R2 - R6 (MINUS_HEX_30)                
    ADD R4, R1, R2                          ;   R4 <- R1 + R2 (COMPUTE SUM)
    ADD R4, R4, R5                          ;   R4 <- R4 + R5 (CONVERT SUM TO ASCII)
    
    LEA R0 MESG                             ;   PRINT "sum is: " without a newline
    PUTS
    
    ADD R0, R4, x0                          ;   LOAD NEWLINE ASCII INTO 
    OUT                                     ;   OUTPUT THE MAGNITUDE OF THE SUM
    
    LD R0 NEWLINE                           ;   OUTPUT 3 NEWLINES
    OUT
    LD R0 NEWLINE
    OUT
    LD R0 NEWLINE
    OUT
    
    LEA R0 GFY                              ;   OUTPUT A WITTLE SPECIAL MESSAGE ;3
    PUTS
    
    LD R0 NEWLINE                           ;   OUTPUT 3 NEWLINES
    OUT
    LD R0 NEWLINE
    OUT
    LD R0 NEWLINE
    OUT
;-------------------------------------------------------------------------
; Halt program execution
;=========================================================================
HALT
;=========================================================================
;=========================================================================
NEWLINE     .FILL       x0A
ASCII       .FILL       x30             ; mask to add to convert to ASCII
NEGASCII    .FILL       xFFD0           ; negated ASCII mask (-x30)
MESG        .STRINGZ    "The sum is: "  
NUM         .STRINGZ    "NUM: "
PROMPT      .STRINGZ    "PLEASE, KINDLY, IF YOU WOULD, GIVE AM 2 NUMBERS TO ADD. THE SUM WILL BE DISPLAYED. GOD FORGIVE US ALL."
GFY         .STRINGZ    "GO FUCK YOURSELF"
;=========================================================================
            .END
;=========================================================================
