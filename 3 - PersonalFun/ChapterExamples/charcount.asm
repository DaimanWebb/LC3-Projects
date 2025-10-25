;==========================================================================
;                       (UPH) UNIVERSAL PROGRAM HEADER
;==========================================================================
;                              Copy—&—Paste
;==========================================================================
;                                   —
;==========================================================================
;   OBJECTIVE: Count occurrences of a user-supplied character in a memory-resident file and display the count as a single ASCII digit
;-------------------------------------------------------------------------
;   1. Read target character from keyboard.
;   2. Scan memory starting at PTR for occurrences of the target.
;   3. Stop at EOT (ASCII x04), convert count to ASCII, display it, halt.
;==========================================================================
;                          HIGH-LEVEL BREAKDOWN
;-------------------------------------------------------------------------
;   1. Initialize counter and load file pointer (PTR).
;   2. Read target character via TRAP x23.
;   3. Loop: load next character via LDR, test for EOT, compare to target, increment counter on match, advance pointer.
;   4. On EOT convert counter to ASCII by adding ASCII '0', display with TRAP x21, then TRAP x25 to halt.
;==========================================================================
;                          REGISTER CONVENTION
;==========================================================================
; R0    : Target character input / output character register
; EOP   : ASCII code of target while scanning; ASCII digit for output
; R1    : Current character read from file / comparison temp
; EOP   : Last character read or comparison result
; R2    : Match counter (0–9)
; EOP   : Final numeric count
; R3    : Pointer to current character in file
; EOP   : Address of next character to read
; R4    : Temporary / EOT test
; EOP   : 0 when EOT detected
; R5    : Unused scratch
; EOP   : 0
; R6    : Unused scratch
; EOP   : 0
; R7    : Unused scratch / link register
; EOP   : 0
;==========================================================================
;
; Program to count occurrences of a character in a file.
; Character to be input from the keyboard.
; Result to be displayed on the monitor.
; Program works only if no more than 9 occurrences are found.
;
;
; Initialization
;
        .ORIG x3000
        AND  R2 R2 #0               ; R2 is counter, initialize to 0
        LD   R3 PTR                 ; R3 is pointer to characters
        TRAP x23                    ; R0 gets character input
        LDR  R1 R3 #0               ; R1 gets the next character

; Test character for end of file
TEST    ADD  R4 R1 #-4              ; Test for EOT (compare to ASCII x04)
        BRz  OUTPUT                 ; If done, prepare the output

; Test character for match. If a match, increment count.
        NOT  R1 R1
        ADD  R1 R1 #1               ; R1 <-- -R1
        ADD  R1 R1 R0               ; R1 <-- R0 - R1, zero if match
        BRnp GETCHAR                ; If no match, skip increment
        ADD  R2 R2 #1               ; Increment count

; Get next character from the file
GETCHAR ADD  R3 R3 #1               ; Increment the pointer
        LDR  R1 R3 #0               ; R1 gets the next character to test
        BRnzp TEST                  ; Loop back to test

; Output the count.
OUTPUT  LD   R0 NEWLINE
        TRAP x21
        LD   R0 ASCII               ; Load the ASCII template ('0')
        ADD  R0 R0 R2               ; Convert binary to ASCII digit
        TRAP x21                    ; Display ASCII digit
        TRAP x25                    ; Halt machine

; Storage for pointer and ASCII template
ASCII   .FILL    x0030                 ; ASCII code for '0'
PTR     .FILL    x4000                 ; Starting address of file characters
NEWLINE .FILL    x0A
        .END

        .ORIG    x4000
HELLO   .STRINGZ "HELLO WORLD!"     ; Example file beginning at x4000; terminate with EOT (x04) when used
        .FILL    #4
        .END