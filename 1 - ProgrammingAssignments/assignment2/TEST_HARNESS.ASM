;=========================================================
; LC-3 TEST HARNESS (for programs starting at x3000)
;=========================================================
        .ORIG x4000          ; <— relocated higher in memory

        LEA R0, PROMPT
        PUTS

        LEA R5, TEST_CASES
NEXT_TEST
        LDR R0, R5, #0
        BRz DONE_TESTS

        LEA R0, DIVIDER
        PUTS

        ADD R6, R5, #0
        JSR STUDENT_CODE

SKIP_STR
        LDR R1, R5, #0
        BRz ADVANCE
        ADD R5, R5, #1
        BRnzp SKIP_STR

ADVANCE
        ADD R5, R5, #1
        BRnzp NEXT_TEST

DONE_TESTS
        LEA R0, END_MSG
        PUTS
        HALT

;---------------------------------------------------------
PROMPT .STRINGZ "=== LC3 TEST HARNESS ===\n"
DIVIDER .STRINGZ "\n-------------------------\n"
END_MSG .STRINGZ "\n=== ALL TESTS COMPLETE ===\n"

TEST_CASES
        .STRINGZ "84"
        .STRINGZ "57"
        .STRINGZ "22"
        .STRINGZ "93"
        .STRINGZ "14"
        .STRINGZ "09"
        .STRINGZ "90"
        .STRINGZ "66"
        .STRINGZ "25"
        .STRINGZ "81"
END_CASES .FILL x0000

;---------------------------------------------------------
STUDENT_CODE
        .FILL x3000     ; your program’s entry point
        .END
