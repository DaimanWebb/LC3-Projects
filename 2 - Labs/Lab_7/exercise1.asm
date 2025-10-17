;; .FILL #65
;; .FILL x0041
.ORIG x3000
    LD R3, DEC_65
    LD R4, HEX_41
    HALT
    
DEC_65    .FILL     #65
HEX_41    .FILL     x0041
          .END