;;; — -         CAPS    LOCK    ON      ALWAYS   ! ! !         — -                     
;-------------------------------------------------------------------------------------------------------------------------------------;
;; REGISTER NOTATION
;; R0 — CHAR INPUT ASCII
;; R1 — SENTINEL (x0A) - INITIALIZED TO ASCII_ENTER USING LD
;; R2 — TEMP REGISTER (HOLDS NEGATED VALUE OF R0)
;; R5 — ARRAY ADDRESS (PTR) - INITIALIZED TO ARRAY_1 USING LEA 
;-------------------------------------------------------------------------------------------------------------------------------------;
;   - PERFORM OPERATION:
;        NOT[ADDEND]
;        ADDEND<—ADDEND+1
;   - CHECK IF LMR IS 0
;       IF 0: SENTINEL ACQUIRED ; ABORT!!
;             TERMINATE ARRAY BY STORING 0 IN NEXT MEMORY LOCATION
;       ELSE: CONTINUE LOOPING =D 

;   NEED A TEMP REGISTER -- R2
;   R2 <— R0
;-------------------------------------------------------------------------------------------------------------------------------------;
                .ORIG x3000
;-------------------------------------------------------------------------------------------------------------------------------------;                
                                    ; INITIALIZATION
    AND R2, R2, #0                  ; Clear R2, use as base+offset 
    ADD R2, R2, #1                  ; load offset with 1 by clearing & adding 1 (vs loading with label holding x1 via .FILL)
    LD R5, ARRAY_1                  ; load array address into R5
    LD R1, ASCII_ENTER              ; load sentinel with sentinel hex — x0A
                                    ; INITIALIZATION COMPLETE
;-------------------------------------------------------------------------------------------------------------------------------------;                                    
                                    ; SENTINEL LOOP GET CHAR FROM KEYBOARD 
    DO_WHILE_LOOP
        BRz END_DO_WHILE_LOOP       ; BREAK LOOP IF CHAR MATCHES SENTINEL
        IN                          ; get char input from keyboard
        STR R0, R5, #0              ; Store contents of R0 in R5's address [populate array with char input (R0)]
        ADD R5, R5, x1
        NOT R2, R0                  ; FLIP ARRAY CHAR BITS BITWISE && STORE IN R2 (TEMP REGISTER)
        ADD R2, R2, x1              ; ADD 1 TO R2 AND STORE BACK IN R2 (2'S COMPLEMENT)
        ADD R2, R2, R1              ; ADD NEGATED R0 TO R1 (SENTINEL)
        BRnzp DO_WHILE_LOOP         ; JMP TO CONDITION (BRz END_DO_WHILE_LOOP)
    END_DO_WHILE_LOOP               ; END LOOP ALIAS
                                    ; LOOP COMPLETE ------ 16 FROM X4000 (X4015)
    AND R2, R2, #6                  ; CLEAR R2 (TEMP REGISTER)                    
    STR R2, R5, #-1                 ; REMEMBER TO NULL TERMINATE ARRAY AFTER LOOP AS NEXT MEMORY LOCATION MAY NOT CONTAIN 0 
                                    ; -1 BECAUSE REGISTER WAS INCREMENTED IN LOOP
;; NEED TO FIGURE OUT A WAY TO INCREMENT/DECREMENT R5 IN A MORE CONVENIENT WAY
;-------------------------------------------------------------------------------------------------------------------------------------;                                    
;; PROGRAM CURRENTLY STORING SENTINEL AT END OF LOOP
;; PROGRAM CURRENTLY TESTING 16 CHAR SIZE INPUT + LF = 17 [ x4000 —> x4011-x4000-1 = #17 - 0 - #1 = #16 = x4010 ]
;-------------------------------------------------------------------------------------------------------------------------------------;                                    
    AND R2, R2, #0                  ; Clear R2, use as base+offset 
    ADD R2, R2, #1                  ; increment offset counter
    LEA R5, ARRAY_1                 ; load array address into R5
;    DO_WHILE_OUTPUT
;        BRz END_DO_WHILE_OUTPUT
;-------------------------------------------------------------------------------------------------------------------------------------;
;                               OUTPUT CHAR CONTENTS TO CONSOLE
    LDR R0, R5, #0              ; load R0 with array value
    PUTS                        ; Output null-terminated char array to console
    AND R0, R0, x0              ; clear R0
    ADD R0, R0, x0A             ; load newline into R0
    OUT                         ; output newline
;        BRnzp DO_WHILE_OUTPUT
;    END_DO_WHILE_OUTPUT 
;                               OUTPUT COMPLETE
;-------------------------------------------------------------------------------------------------------------------------------------;
    HALT                        ; HALT PROGRAM
;-------------------------------------------------------------------------------------------------------------------------------------;    
                                ; LOCAL DATA BLOCK
ARRAY_1         .FILL       x4000   ; MODIFIED[.BLKW —> .FILL — #10 —> x4000]
ASCII_ENTER     .FILL       x0A     ; MODIFIED[#10 —> x0A] | Enter = LF = ASCII 10 (x0A), NOT CR (x0D)!!
                .END 
;-------------------------------------------------------------------------------------------------------------------------------------;
;; Another hint: we will actually need 2 SEPARATE sentinels!
;; First, you have to use a specific key to tell the program to stop collecting characters from the
;; keyboard
;; Tthen, you have to store a sentinel in the array to mark the end of the collected characters
;;  - It must capture a sequence of characters as long as you like and stop when you enter your "input" sentinel character
;;  - The program will store each character as it is entered in an array starting at x4000 terminated by the sentinel character
;;  - tThen, in a separate loop, output them all to console
;;  - Remove the newline after each character output - i.e. the entire array will now be output on a single line
;;  - DO terminate that line with a newline.

;; REMEMBER: NO .BLKW ALLOWED!!

;; There are three separate problems to be solved here:
;;   - ENTER | How do I communicate to the program that I have finished input?
;;   - NULL TERMINATED ARRAY | How do I build the array so that it “knows” where it ends 
;;   - NULL TERMINATED ARRAY [PUTS] | How does the program know when to stop traversing the array for output?



                
; MODULES:
;   - INITIALIZATION
;   - SENTINEL-CONTROLLED LOOP
;   - OUTPUT ARRAY
;
; SENTINEL-TERMINATION LOGIC:
;   - IF INPUT CHAR & SENTINEL ARE SAME, IN - CHAR = 0
;   - PERFORM OPERATION:
;        NOT[ADDEND]
;        ADDEND<—ADDEND+1
;   - CHECK IF LMR IS 0
;       IF 0: SENTINEL ACQUIRED ; ABORT!!
;             TERMINATE ARRAY BY STORING 0 IN NEXT MEMORY LOCATION
;       ELSE: CONTINUE LOOPING =D 

; Create a sentinel-terminated loop starting at x4000
;   Use ENTER ASCII as sentinel — STORED IN R1
; TAKE IN A CHAR AND STORE IN BASE+OFFSET ADDRESS

            