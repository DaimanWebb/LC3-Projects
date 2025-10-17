;; test IN vs GETC and OUT vs PUTS
;; replace DEC_65 and HEX_41 with x4000 and x4001, respectively
;; what box appears when using #?

.ORIG x3000
    LD R5, DEC_65_PTR         ; OUT OF RANGE
    LD R6, HEX_41_PTR         ; OUT OF RANGE
    LDR R3, R5, #0          ; ALLOWS FOR BASE+OFFSET ADDRESSING
    LDR R4, R6, #0          ; ALLOWS FOR BASE+OFFSET ADDRESSING
    ADD R3, R3, #1
    ADD R4, R4, #1
    STR R3, R5, #0
    STR R4, R6, #0
    HALT
    
    DEC_65_PTR      .FILL      x4000
    HEX_41_PTR      .FILL      x4001
                    .END

.ORIG x4000
    NEW_DEC_65      .FILL      #65
    NEW_HEX_41      .FILL      x0041
                    .END