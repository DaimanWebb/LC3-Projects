
        .ORIG x3000
LEA R1, ARRAY
LD R2, DATA
LD R3, DEC_10
LD R5, SUB_FILL_ARRAY
ADD R6, R1, x0
JSRR R5
HALT

ARRAY               .BLKW   #10
SUB_FILL_ARRAY      .FILL   x3200
DEC_10              .FILL   #10
DATA                .FILL   #0
                    .END

;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------

        .ORIG x3200
    DO_WHILE_LOOP
        BRz END_DO_WHILE_LOOP    
        STR R2, R1, #0
        ADD R1, R1, #1
        ADD R2, R2, #1
        ADD R3, R3, #-1
        BRnzp DO_WHILE_LOOP         
    END_DO_WHILE_LOOP      

ADD R1, R6, x0                              ; REVERT R1 TO ORIGINAL ADDRESS
RET
                    .END

;; Create an array of size 10 in local data (the data of the main program).
;; Create a new subroutine called “SUB_FILL_ARRAY_3200”
;;  - R1 should be a parameter with the address of the array from local data.
;;  - Programmatically populate the array with 0 through 9 (decimal numbers, not ASCII).
;;  - At the end of the subroutine, revert R1 to the original address of the array!
;;  - In the main program, call the subroutine you created!

;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY
; Parameter (R1): The starting address of the array. This should be
; unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------
