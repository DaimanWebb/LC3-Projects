;; hard code local data values x61 and x1A 
;; load them into R0 & R1, respectively
;; Inside a loop, output to console the contents of R0 as an ASCII character
;; Use R1 as the loop counter, decrementing it each time through the loop, right before the BR instruction
;; If you do it right, the loop will be executed exactly x1A times
;; What does this loop do? Can you figure it out before you run it?
;; test IN vs GETC and OUT vs PUTS
;; Hint: you will need to use ADD, BR, and possibly AND

.ORIG x3000
    LD R0, HEX_61
    LD R1, HEX_1A
    ; LD R2, HEX_30
LOOP
    BRz END_LOOP
    OUT                     ;; PUTS(?) // SHOULD DISPLAY LOWERCASE A AS AN ASCII CHARACTER
    ; AND R0, R0, #0        ;; CLEAR R0
    ; ADD R0, R2, R0        ;; ASSIGN R0 TO R2
    ; ADD R2, R2, #1        ;; INCREMENT R2
    ADD R1, R1, #-1
    BRnzp LOOP
END_LOOP    
    HALT
    
HEX_61      .FILL       x61
HEX_1A      .FILL       x1A
HEX_30      .FILL       x30
            .END
