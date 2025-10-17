;; test IN vs GETC and OUT vs PUTS
;; replace DEC_65 and HEX_41 with x4000 and x4001, respectively
;; what box appears when using #?

.ORIG x3000
    ; LD R3, NEW_DEC_65         ; OUT OF RANGE
    ; LD R4, NEW_HEX_41         ; OUT OF RANGE
    LDI R3, DEC_65_PTR          ; ALLOWS FOR INDIRECT ADDRESSING
    LDI R4, HEX_41_PTR          ; ALLOWS FOR INDIRECT ADDRESSING
    ADD R3, R3, #1
    ADD R4, R4, #1
    STI R3, DEC_65_PTR
    STI R4, HEX_41_PTR
    HALT
    
    DEC_65_PTR      .FILL      x4000
    HEX_41_PTR      .FILL      x4001
                    .END

.ORIG x4000
    NEW_DEC_65      .FILL      #65
    NEW_HEX_41      .FILL      x0041
                    .END