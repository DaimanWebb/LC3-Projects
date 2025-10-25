;==========================================================================
;                       (UPH) UNIVERSAL PROGRAM HEADER                            
;==========================================================================
;                              Copy—&—Paste 
;==========================================================================
;                                   —
;==========================================================================
;   OBJECTIVE: IMPLEMENT A PROGRAM TO MULTIPLY AN INTEGER BY THE CONSTANT 6
;-------------------------------------------------------------------------
;   1. Load the constant 6 and the input value.
;   2. Use a loop to add the input value to an accumulator 6 times.
;==========================================================================
;                          HIGH-LEVEL BREAKDOWN     
;-------------------------------------------------------------------------
;   1. Initialize R1 with 6 and R2 with the input value.
;   2. Loop: add R2 to R3, decrement R1, repeat until R1 == 0.
;   3. Halt when multiplication is complete.
;==========================================================================
;                          REGISTER CONVENTION
;==========================================================================
;-------------------------------------------------------------------------
; R0    : Unused         
; EOP   : 0
;-------------------------------------------------------------------------
; R1    : Loop counter (initially 6)
; EOP   : 0
;-------------------------------------------------------------------------
; R2    : Input value to be multiplied
; EOP   : Original input value
;-------------------------------------------------------------------------
; R3    : Accumulator for result (R2 × 6)
; EOP   : Final product
;-------------------------------------------------------------------------
; R4    : Unused
; EOP   : 0
;-------------------------------------------------------------------------
; R5    : Unused
; EOP   : 0
;-------------------------------------------------------------------------
; R6    : Unused
; EOP   : 0
;-------------------------------------------------------------------------
; R7    : Unused
; EOP   : 0
;==========================================================================

; Program to multiply an integer by the constant 6.
; Before execution, an integer must be stored in NUMBER.

.ORIG x3050
LD R1, SIX               ; Load constant 6 into R1
LD R2, NUMBER            ; Load input value into R2
AND R3, R3, #0           ; Clear R3. It will contain the product.

; The inner loop
AGAIN ADD R3, R3, R2     ; Add R2 to R3 (accumulate product)
ADD R1, R1, #-1          ; R1 keeps track of the iterations
BRp AGAIN                ; Loop if R1 > 0

HALT                     ; Stop execution

NUMBER .BLKW 1           ; Reserve space for input value
SIX    .FILL x0006       ; Constant 6
       .END


