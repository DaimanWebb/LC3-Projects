;; Now, write a program that builds and populates an array in the local data area:
;; ● Use .BLKW to set up a blank array of 10 locations in the local data area (no remote data this time)
;; ● This is where you will have to use the LEA instruction to get the actual 
;; ● starting address of the array into a register!
;; Then, have the program prompt the user to enter exactly 10 characters from the keyboard
;; ● populate that array with the characters as they are input.
;; ● this will require a counter-controlled loop (DO-WHILE loop)
;; Test your program, inspecting the contents of the array after every character input
;; you should now understand one of the deep mysteries of C++ - 
;; why the number of elements in a static array variable must be known at compile time
;; , and can't be changed after that

; Build & populate an array in the local data area
; Use .BLKW to set up a blank array of 10 locations in the local data
; Prompt the user to enter exactly 10 characters from the keyboard
; Populate that array with the characters as they are input
; Counter-controlled loop (DO-WHILE loop)

            .ORIG x3000
    AND R2, R2, #0                  ; Clear R2, use as base+offset 
    ADD R2, R2, #1                  ; increment offset counter
    LEA R5, ARRAY_1                 ; load array address into R5
    LD R1, DEC_10                   ; Load counter with 10 -- comes after clearing R2 to pass BRz END_DO_WHILE check

    DO_WHILE_LOOP
        BRz END_DO_WHILE
        IN                          ; get char input from keyboard
        STR R0, R5, #0              ; Store contents of R0 in R5's address [populate array with char input (R0)]
        ADD R5, R5, R2              ; get next array index (base+offset)
        ADD R1, R1, #-1             ; decrement counter
        BRnzp DO_WHILE_LOOP
    END_DO_WHILE      
            
    HALT
    
ARRAY_1     .BLKW       #10
DEC_10      .FILL       #10
            .END


