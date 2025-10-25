;==========================================================================
;                       (UPH) UNIVERSAL PROGRAM HEADER                           
;==========================================================================
;                              Copy—&—Paste 
;==========================================================================
;                                   —
;==========================================================================
;   OBJECTIVE:
;-------------------------------------------------------------------------
;   1. 
;   2. 
;==========================================================================
;                          HIGH-LEVEL BREAKDOWN    
;-------------------------------------------------------------------------
;   1. 
;   2.
; Pseudocode:
; for(i = 15 downto 0):
; if (msb is a 1):
; print a 1
; else:
; print a 0
; shift left

; Note:
; 1. There are spaces after the first three "packets" of 4 bits (but no space character at end!)
; 2. There is a newline after the output - again, there is NO space before the newline
; 3. You must use the memory address specified in your template to hold the value to be output
; Your code will obviously be tested with a range of different values: Make sure you test your code
; likewise!

; SAMPLE OUTPUT:
; 1O1O 1O11 11OO 11O1         ; HINT: WHAT NUMBER IS THIS?
;==========================================================================
;                          REGISTER CONVENTION
;==========================================================================
;-------------------------------------------------------------------------
; R0    :         
; EOP   : 
;-------------------------------------------------------------------------
; R1    :
; EOP   : 
;-------------------------------------------------------------------------
; R2    :
; EOP   : 
;-------------------------------------------------------------------------
; R3    :
; EOP   : 
;-------------------------------------------------------------------------
; R4    :
; EOP   :
;-------------------------------------------------------------------------
; R5    :
; EOP   :
;-------------------------------------------------------------------------
; R6    :
; EOP   :
;-------------------------------------------------------------------------
; R7    :
; EOP   :
;-------------------------------------------------------------------------
;==========================================================================


.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------


HALT
;---------------	
;Data
;---------------
Value_ptr	.FILL xCA01	; The address where value to be displayed is stored

.END

.ORIG xCA01					; Remote data
Value .FILL xABCD			; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
