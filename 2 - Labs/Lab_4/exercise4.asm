; Copy the exercise 3 code into your exercise 4 file.
; ● Create a new subroutine at x3800 called “SUB_PRETTY_PRINT_ARRAY_3800”
; ○ Print out “=====” (5 equal signs) before and after printing out the array.
; ○ Call your “SUB_PRINT_ARRAY” subroutine. Do not copy the print array logic!
; ● Call the subroutine in the main program after calls to your previous subroutines.
; ● This will not work properly! Step through the program and answer the questions in the lab
; manual.
; Exercise 4



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

    ;; REMEMBER TO SAVE & LOAD REGISTERS !!

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

ARRAY                   .BLKW   #10
SUB_FILL_ARRAY          .FILL   x3200
SUB_CONVERT_ARRAY       .FILL   x3400
SUB_PRINT_ARRAY         .FILL   x3600
SUB_PRETTY_PRINT_ARRAY  .FILL   x3800
EQUALS                  .FILL   x3D
DEC_10                  .FILL   #10
DATA                    .FILL   #0
HEX_30                  .FILL   x30
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
; ;------------------------------------------------------------------------
; ; Subroutine: SUB_PRETTY_PRINT_ARRAY
; ; Parameter (R1): The starting address of the array. This should be unchanged
; at the end of the subroutine!
; ; Postcondition: Prints out “=====” (5 equal signs), prints out the array,
; and after prints out “=====” again.
; ; Return Value (None)
; ;-------------------------------------------------------------------------
        .ORIG x3800
    ;; REMEMBER TO SAVE & LOAD REGISTERS !!

    EQUALS_LOOP_3800
        BRz END_EQUALS_LOOP_3800
        ADD R0, R5, x0
        OUT
        ADD R4, R4, #-1
        BRnzp EQUALS_LOOP_3800
    END_EQUALS_LOOP_3800
    
    DO_WHILE_LOOP_3800
        BRz END_DO_WHILE_LOOP_3800
        LDR R0, R1, #0
        OUT
        ADD R1, R1, #1
        ADD R3, R3, #-1
        BRnzp DO_WHILE_LOOP_3800        
    END_DO_WHILE_LOOP_3800 

    EQUALS_LOOP_3800_1
        BRz END_EQUALS_LOOP_3800_1
        ADD R0, R5, x0
        OUT
        ADD R4, R4, #-1
        BRnzp EQUALS_LOOP_3800_1
    END_EQUALS_LOOP_3800_1
    
ADD R1, R6, x0                              ; REVERT R1 TO ORIGINAL ADDRESS
RET
                    .END          
        
        
        