; extend it by adding another loop to traverse the array again
; output each stored character to the console, one per line (i.e. print a newline '\n' = ASCII x0A after each character)
;; Your program will now be complete: it will accept exactly 10 characters from input, storing them one by
;; one in a remote array, and then output the whole list to console, one character per line.

            .ORIG x3000
    AND R2, R2, #0                  ; Clear R2, use as base+offset 
    ADD R2, R2, #1                  ; increment offset counter
    LEA R5, ARRAY_1                 ; load array address into R5
    LD R1, DEC_10                   ; Load counter with 10 || Comes AFTER clearing R2 to pass BRz END_DO_WHILE check

    DO_WHILE_LOOP
        BRz END_DO_WHILE_LOOP
        IN                          ; get char input from keyboard
        STR R0, R5, #0              ; Store contents of R0 in R5's address [populate array with char input (R0)]
        ADD R5, R5, R2              ; get next array index (base+offset)
        ADD R1, R1, #-1             ; decrement counter
        BRnzp DO_WHILE_LOOP
    END_DO_WHILE_LOOP     
    
    AND R2, R2, #0                  ; Clear R2, use as base+offset 
    ADD R2, R2, #1                  ; increment offset counter
    LEA R5, ARRAY_1                 ; load array address into R5
    LD R1, DEC_10                   ; Load counter with 10 -- comes after clearing R2 to pass BRz END_DO_WHILE check
    
    DO_WHILE_OUTPUT
        BRz END_DO_WHILE_OUTPUT
        LDR R0, R5, #0              ; load R0 with array value
        ADD R5, R5, R2              ; get next array index (base+offset)
        OUT                         ; Output char to console
        AND R0, R0, x0              ; clear R0
        ADD R0, R0, x0A             ; load newline into R0
        OUT                         ; output newline
        ADD R1, R1, #-1             ; decrement counter
        BRnzp DO_WHILE_OUTPUT
    END_DO_WHILE_OUTPUT 
            
    HALT
    
ARRAY_1     .BLKW       #10
DEC_10      .FILL       #10
            .END