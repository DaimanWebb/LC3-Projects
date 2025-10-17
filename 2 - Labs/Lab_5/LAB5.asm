
.ORIG x3000                   ; start the program at x3000
        AND R1, R1, x0        ; initialize R1 -> 0 ; this will hold the sum
        AND R4, R4, x0        ; initialize R4 -> 0 
        ADD R4, R4, #10       ; R4 holds count of values left to add (10 values)
        LEA R2, x0FC          ; R2 will point to the current number to add  //  x3004[PC] + x0FC = x3100

LOOP    LDR R3, R2, x0        ; load the current number to add into R3 -- notice the label LOOP here
        ADD R2, R2, #1        ; increment R2 to point to the next number
        ADD R1, R1, R3        ; add the current number to the sum in R1
        ADD R4, R4, #-1       ; decrement the count in R4
        BRp LOOP              ; if R4 > 0, repeat the loop
        HALT                  ; HALT PROGRAM
        
.END                          ; Tell assembler assembly job is finished

