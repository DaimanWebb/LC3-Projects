;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Daiman Webb
; Email: dwebb019@ucr.edu
; 
; Assignment name: Assignment 1
; Lab section: 021
; TA: 
; 
; I hereby certify that code was totally given to me, 
; and that I didnt come up with any of it   =P
;
;=========================================================================

;------------------------------------------
;REG VALUES         R0 R1 R2 R3 R4 R5 R6 R7
;------------------------------------------
;Pre-loop:          0  6  12 0  0  0  0  0
;Iteration 01:      0  5  12 12 0  0  0  0
;Iteration 02:      0  4  12 24 0  0  0  0
;Iteration 03:      0  3  12 36 0  0  0  0
;Iteration 04:      0  2  12 48 0  0  0  0
;Iteration 05:      0  1  12 60 0  0  0  0
;;End of program:   0  0  12 72 0  0  0  0 
;
;5 iterations because branch conditions was positive, so 6
;iterations count how many times branch was taken, as:
;;end of program is technically an execution of the loop body
;

; the following program performs the action:
;       Mutiply 12 by 6 and write the result into Register 3
;       (i.e., R3 <-- 12 * 6)

.ORIG x3000			; Program begins here
;-------------
;Instructions: CODE GOES HERE
;-------------
LD R1, DEC_06 
LD R2, DEC_12
AND R3, R3, #0

D0_WHILE    ADD R3, R3, R2                  ;R3<--R3+R2
            ADD R1, R1, #-1                 ;R3<--R1-1   
            BRp D0_WHILE                    ;if (LMR > 0) (R1>0), go to D0_WHILE


HALT                                        ;terminate the program
;---------------	
;Data (.FILL, .STRINGZ, .BLKW)
;---------------
DEC_00    .FILL     #0                      ; put the value 0 into memory here
DEC_06    .FILL     #6                      ; put the value 6 into memory here
DEC_12    .FILL     #12                     ; put the value 12 into memory here 

;---------------	
;END of PROGRAM
;---------------	
.END


