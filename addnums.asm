.ORIG x3000
        AND R1, R1, x0
        AND R4, R4, x0
        ADD R4, R4, #10
        LEA R2, PTR
LOOP    LDR R3, R2, x0
        ADD R2, R2, #1
        ADD R1, R1, R3
        ADD R4, R4, #-1
        BRp LOOP
        HALT

;        AND R6, R6, #0      ; PURELY HYPOTHETICAL IF WE TRIED TO LOAD --- WITH A VALUE FROM R6, LET'S SAY
;        ADD R6, R6, #5      ; CONT.
;        ST R6, ---
;---                        ;   Why does it say the following?  :
                            ;       Multiple label at the same memory location. 
                            ;       LC3 addnums.asm(12,1): Label --- and PTR are at the same memory 
                            ;       Illegal label name. LC3 addnums.asm(12,1): Label name is illegal
                            
PTR     .FILL   x0FC       
        .END           

