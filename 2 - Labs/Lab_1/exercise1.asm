    ;; Create a program that multiplies R1 by R2 and stores the result in R3
    ;; R1 = Multiplicand
    ;; R2 = Multiplier (COUNTER)
    ;; R3 = Product (Result)
    ;; Clear all registers
    ;; Run a loop with R2 as the counter
    ;; In each iteration, add R1 to R3 and decrement R2
    ;; Output the result

.ORIG x3000
    AND R3, R3, #0      ;; Clear R0
    AND R1, R1, #0      ;; Clear R1
    AND R2, R2, #0      ;; Clear R2
    
    LEA R0, REG_DATA
    LDR R1, R0, #0
    ADD R0, R0, #1
    LDR R2, R0, #0
    
    MULT BRz END_LOOP 
    ADD R3, R3, R1      ;; R3 = R1 + R2
    ADD R2, R2, #-1     ;; Decrement R2
    BRnzp MULT          ;; If R2 == 0, exit loop
    END_LOOP
    
    HALT

REG_DATA    .FILL       #5
            .FILL       #6
            .END

