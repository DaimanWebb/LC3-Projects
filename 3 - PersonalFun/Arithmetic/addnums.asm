
;==========================================================================
;                       (UPH) UNIVERSAL PROGRAM HEADER                           
;==========================================================================
;                              Copy—&—Paste 
;==========================================================================
;                                   —
;==========================================================================
;       OBJECTIVE:
;-------------------------------------------------------------------------
;       1. TO ADD TEN NUMBERS STORED IN MEMORY LOCATIONS x3100 TO x310A AND 
;       2. STORE THE SUM IN R1
;==========================================================================
;                          HIGH-LEVEL BREAKDOWN    
;-------------------------------------------------------------------------
;       1. INITIALIZE REGISTERS
;       2. LOAD THE ADDRESS OF THE FIRST NUMBER TO BE ADDED INTO R2
;       3. LOOP TO ADD EACH NUMBER:
;           A. LOAD THE CURRENT NUMBER TO BE ADDED INTO R3
;           B. ADD THE CURRENT NUMBER TO THE SUM IN R1
;           C. INCREMENT THE POINTER IN R2 TO THE NEXT NUMBER
;           D. DECREMENT THE COUNT IN R4
;           E. REPEAT UNTIL ALL NUMBERS ARE ADDED 
;       4. R1 SHOULD CONTAIN 55 AT THE VERY END (0+1+2+3+4+5+6+7+8+9+10 = 55)
;==========================================================================
;                          REGISTER CONVENTION
;==========================================================================
;-------------------------------------------------------------------------
; R0 - 
;-------------------------------------------------------------------------
; R1 - HOLDS THE SUM OF VALUES TO BE ADDED FROM x3100 — x310A (SHOULD CONTAIN 55 AT THE VERY END)
;-------------------------------------------------------------------------
; R2 - POINTER TO THE NEXT NUMBER TO BE ADDED
;-------------------------------------------------------------------------
; R3 - HOLDS THE CURRENT NUMBER TO ADDED NEXT
;-------------------------------------------------------------------------
; R4 - HOLDS THE COUNT OF VALUES LEFT TO ADD (INITIALIZED TO 10)
;-------------------------------------------------------------------------
; R5 - 
;-------------------------------------------------------------------------
; R6 - 
;-------------------------------------------------------------------------
; R7 - 
;-------------------------------------------------------------------------
;==========================================================================

.ORIG x3000                   ; start the program at x3000
        AND R1, R1, x0        ; initialize R1 -> 0 ; this will hold the sum (SHOULD CONTAIN 55 AT THE VERY END)
        AND R4, R4, x0        ; initialize R4 -> 0 
        ADD R4, R4, #10       ; R4 holds count of values left to add (10 values)
        LEA R2, x0FC          ; [PC] = x3004 + x0FC = x3100 -> R2

LOOP    LDR R3, R2, x0        ; load the current number to add into R3
        ADD R2, R2, #1        ; increment R2 to point to the next number
        ADD R1, R1, R3        ; add the current number to the sum in R1
        ADD R4, R4, #-1       ; decrement the count in R4
        BRp LOOP              ; if R4 > 0, repeat the loop
        HALT                  ; HALT PROGRAM
        
        .END                  ; Tell assembler assembly job is finished


.ORIG x3100                   ; start the data at x3100
        .FILL #1              ; first number to add
        .FILL #2              ; second number to add
        .FILL #3              ; third number to add
        .FILL #4              ; fourth number to add
        .FILL #5              ; fifth number to add
        .FILL #6              ; sixth number to add
        .FILL #7              ; seventh number to add
        .FILL #8              ; eighth number to add
        .FILL #9              ; ninth number to add
        .FILL #10             ; tenth number to add
        .END
