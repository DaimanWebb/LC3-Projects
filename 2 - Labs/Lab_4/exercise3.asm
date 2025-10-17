
; Copy the exercise 2 code into your exercise 3 file.
; ● Create a new subroutine at x3600 called “SUB_PRINT_ARRAY_3600”
; ○ Load each element from the array, and print it out using OUT.
; ● Call the subroutine in the main program after calls to your previous subroutine.
; ● Ensure that the program runs correctly such that 0 through 9 prints out to the console
; (e.g. “0123456789”).

; Create a new subroutine at x3400! Subroutine should:
;   - load each element from the array
;   - convert it to an ASCII character
;   - store it back into the array
; Call the subroutine in your main program (placed after the call to your previous subroutine)


;-------------------------------------------------------------------------
; MAIN PROGRAM
;-------------------------------------------------------------------------

        .ORIG x3000
LEA R1, ARRAY
LD R2, DATA
LD R3, DEC_10
LD R5, SUB_FILL_ARRAY
ADD R6, R1, x0          ; SAVE R1 INTO R6
JSRR R5
LD R2, HEX_30
LD R5, SUB_CONVERT_ARRAY
JSRR R5
HALT

ARRAY               .BLKW   #10
SUB_FILL_ARRAY      .FILL   x3200
SUB_CONVERT_ARRAY   .FILL   x3400
SUB_PRINT_ARRAY     .FILL   x3600
DEC_10              .FILL   #10
DATA                .FILL   #0
HEX_30              .FILL   x30
                    .END

;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------

        .ORIG x3200
    DO_WHILE_LOOP_3200
        BRz END_DO_WHILE_LOOP_3200
        STR R2, R1, #0
        ADD R1, R1, #1
        ADD R2, R2, #1
        ADD R3, R3, #-1
        BRnzp DO_WHILE_LOOP_3200        
    END_DO_WHILE_LOOP_3200

ADD R1, R6, x0                              ; REVERT R1 TO ORIGINAL ADDRESS
RET
                    .END

;------------------------------------------------------------------------
; Subroutine: SUB_CONVERT_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (number) in the array should be represented as a character. E.g. 0 -> ‘0’
; Return Value (None)
;-------------------------------------------------------------------------

        .ORIG x3400
    DO_WHILE_LOOP_3400
        BRz END_DO_WHILE_LOOP_3400
        LDR R4, R1, #0
        ADD R4, R2, R4
        STR R4, R1, #0
        ADD R1, R1, #1
        ADD R3, R3, #-1
        BRnzp DO_WHILE_LOOP_3400        
    END_DO_WHILE_LOOP_3400       

ADD R1, R6, x0                              ; REVERT R1 TO ORIGINAL ADDRESS
RET
                    .END

; ;------------------------------------------------------------------------
; ; Subroutine: SUB_PRINT_ARRAY
; ; Parameter (R1): The starting address of the array. This should be unchanged at the
; end of the subroutine!
; ; Postcondition: Each element (character) in the array is printed out to the
; console.
; ; Return Value (None)
; ;-------------------------------------------------------------------------

        .ORIG x3600
    DO_WHILE_LOOP_3600
        BRz END_DO_WHILE_LOOP_3600
        LDR R0, R1, #0
        OUT
        ADD R1, R1, #1
        ADD R3, R3, #-1
        BRnzp DO_WHILE_LOOP_3600        
    END_DO_WHILE_LOOP_3600       
    
ADD R1, R6, x0                              ; REVERT R1 TO ORIGINAL ADDRESS
RET
                    .END        
        
        
        