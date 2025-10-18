
.ORIG x3000                   ; start the program at x3000
        AND R1, R1, x0        ; initialize R1 -> 0 ; this will hold the sum
        AND R4, R4, x0        ; initialize R4 -> 0 
        ADD R4, R4, #10       ; R4 holds count of values left to add (10 values)
        LD R2,  PTR           ; LDI (vs LEA) will load the value at the address in PTR into R2
                              
LOOP    LDR R3, R2, x0        ; load the current number to add into R3 -- notice the label LOOP here
        ADD R2, R2, #1        ; increment R2 to point to the next number
        ADD R1, R1, R3        ; add the current number to the sum in R1
        ADD R4, R4, #-1       ; decrement the count in R4
        BRp LOOP              ; if R4 > 0, repeat the loop
        HALT                  ; HALT PROGRAM
        
PTR     .FILL   x3100  ; shouldnt this hiold the value x0fc           
        .END  

; Note:

; originally, we loeaded x0FC directly into R2 using LEA

; now, we use a label PTR to hold the value x0FC

; and we load the address of PTR into R2 using LEA

; this is more flexible because if we want to change the address of the data

; we only need to change the value in PTR, not the instruction that loads it

; also, using labels makes the code more readable and maintainable

.ORIG x3100                   ; start the data at x3100
        .FILL #1               ; first number to add
        .FILL #2              ; second number to add
        .FILL #3              ; third number to add
        .FILL #4              ; fourth number to add
        .FILL #5              ; fifth number to add
        .FILL #6              ; sixth number to add
        .FILL #7              ; seventh number to add
        .FILL #8              ; eighth number to add
        .FILL #9              ; ninth number to add
        .FILL #10              ; tenth number to add
        .END