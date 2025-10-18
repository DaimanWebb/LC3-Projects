;=========================================================================
;-------------------------------------------------------------------------
; REGISTER CONVENTION
;-------------------------------------------------------------------------
; R0 - OUTPUT REGISTER
;-------------------------------------------------------------------------
; R1 
;-------------------------------------------------------------------------
; R2
;-------------------------------------------------------------------------
; R4
;-------------------------------------------------------------------------
; R5 - NEGASCII
;-------------------------------------------------------------------------
; R6 - ASCII
;-------------------------------------------------------------------------
; R7
;-------------------------------------------------------------------------
;=========================================================================

;=========================================================================
;; COPY-PASTE SYMBOLS (COMMENT, M-DASH, ETC.)
;-------------------------------------------------------------------------
                            ;
                                                                        —
;=========================================================================

.ORIG x3000
TRAP x23                                ;   IN TRAP VECTOR
LD R5, ASCII                            ;   Load R6 with ASCII
LD R6, NEGASCII                         ;   Load R5 with NEGASCII
ADD R1, R0, x0                          ;   CLEAR R1      
ADD R1, R1, R5                          ;   INIT R1 TO R5 
TRAP x23                                ;   IN TRAP VECTOR
ADD R0, R0, R5
ADD R2, R0, R1 ; ADD CHAR INPUT TO NEGASCII TO GET RAW NUMBER
ADD R2, R2, R6 ; 
LEA R0, MESG                            ;   LOAD R0 WITH ADDRESS OF MESG TO DISPLAY AS A STRING
TRAP x22                                ;   PUTS TRAP VECTOR
ADD R0, R2, x0                          ;   I ASSUME DECREMENT R0 BY NEGASCII
TRAP x21                                ;   OUT TRAP VECTOR
HALT

ASCII       .FILL       x30             ; mask to add to convert to ASCII
NEGASCII    .FILL       xFFD0           ; negated ASCII mask (-x30)
MESG        .STRINGZ    "The sum is: "  
            .END
            
        
            
;; LOOKS LIKE THIS PROGRAM PROMPTS THE USER FOR TWO NUMBERS, ADDS THEM TOGETHER, AND DISPLAYS THE SUM
;; INPUT: TWO SINGLE-DIGIT NUMBERS FROM THE KEYBOARd