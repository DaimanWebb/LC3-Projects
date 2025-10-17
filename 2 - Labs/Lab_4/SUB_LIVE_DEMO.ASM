
        .ORIG x3000
LD R5, SUB_MULT_2_3200
JSRR R5
HALT

SUB_MULT_2_3200     .FILL   x3200
                    .END

;-----------------------------------------------------------------------
; Subroutine: SUB_MULT_2_3200
; Parameter (R1): Value to multiply by 2.
; Postcondition: Multiply the value in R1 by 2 and store it in R3.
; Return Value (R3): R3 had 10 added to it.
;-----------------------------------------------------------------------

        .ORIG x3200
ADD R3, R1, R1
ADD R3, R3, #10
RET
                    .END
