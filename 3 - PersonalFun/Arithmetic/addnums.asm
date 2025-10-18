
.ORIG x3000                   ; start the program at x3000
        AND R1, R1, x0        ; initialize R1 -> 0 ; this will hold the sum
        AND R4, R4, x0        ; initialize R4 -> 0 
        ADD R4, R4, #10       ; R4 holds count of values left to add (10 values)
        LEA R2, x0FC          ; R2 will point to the current number to add  //  x3004[PC] + x0FC = x3100
                              ; hardcoded address of first number ; could use a label here
LOOP    LDR R3, R2, x0        ; load the current number to add into R3 -- notice the label LOOP here
        ADD R2, R2, #1        ; increment R2 to point to the next number
        ADD R1, R1, R3        ; add the current number to the sum in R1
        ADD R4, R4, #-1       ; decrement the count in R4
        BRp LOOP              ; if R4 > 0, repeat the loop
        HALT                  ; HALT PROGRAM
        
        .END                          ; Tell assembler assembly job is finished

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

;         AND R6, R6, #0      ; PURELY HYPOTHETICAL IF WE TRIED TO LOAD --- WITH A VALUE FROM R6, LET'S SAY
;         ADD R6, R6, #5      ; CONT.
;         ST R6, ---
; ---     .FILL   #36         ;   Why does it say the following?  :
;       Multiple labels at the same memory location. 
;       LC3 addnums.asm(12,1): Label --- and PTR are at the same memory 
;       Illegal label name. LC3 addnums.asm(12,1): Label name is illegal-IMMIGRANT