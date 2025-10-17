;; test IN vs GETC and OUT vs PUTS
;; replace DEC_65 and HEX_41 with x4000 and x4001, respectively
;; what box appears when using #?

.ORIG x3000
    LD R5, data_ptr         ; OUT OF RANGE
    LDR R3, R5, #0          ; ALLOWS FOR BASE+OFFSET ADDRESSING
    ADD R3, R3, #1
    STR R3, R5, #0
    LDR R3, R5, #1          ; ALLOWS FOR BASE+OFFSET ADDRESSING
    ADD R3, R3, #1
    STR R3, R5, #1
    
    HALT
    
    DATA_PTR      .FILL      x4000
                    .END

.ORIG x4000
    NEW_DEC_65      .FILL      #65
    NEW_HEX_41      .FILL      x0041
                    .END