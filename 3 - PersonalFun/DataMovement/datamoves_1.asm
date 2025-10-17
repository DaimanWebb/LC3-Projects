;; Test the movement data instructions ;;


.ORIG x3000                   ;; start the program at x3000
        AND R2, R2, #0        ;; PURELY HYPOTHETICAL IF WE TRIED TO LOAD --- WITH A VALUE FROM R6, LET'S SAY
        ADD R2, R2, #5        ;; CONT.
        ST R2, ---            
        
        STI R2, PTR          
        AND R5, R5, X0
        ADD R5, R5, xA
        ST R5, ---
        
        AND R4, R4, #0
        AND R6, R6, #0
        LEA R4, ---
        LEA R6, PTR
        AND R1, R1, #0
        ADD R1, R1, #7
        LDR R1, R4, #0
        LDR R1, R6, #0
        HALT
        
PTR     .FILL   x3000       ;;  label to hold the address of the first number to add
---     .FILL   x3010        ;;  hypothetical address to store 5 in
        .END  
         ; R4 will hold the count of numbers left to add
         ; R2 will point to the current number to add
         ; R3 will hold the current number to add
         
         ; Load the address of the first number into R2
         ; We can use a label or hardcode the address
         
         ; Using a label:
         ; LEA R2, PTR          ; load effective address of PTR into R2
         
         ; Hardcoding the address:

