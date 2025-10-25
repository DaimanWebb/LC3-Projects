.ORIG x3000

LD R1 PTR
LD R2 NEWLINE
LEA R0, STRING
PUTS
LABEL   
        GETC
        STR R0 R1 #0
        ADD R4 R0 x0
        ADD R1 R1 #1
        NOT R4 R4
        ADD R4 R4 #1
        ADD R3 R2 R4
        BRz END
        LD R0 STAR
        OUT
        BRnzp LABEL
        AND R0 R0 x0
        STR R0 R1 #0
        LD R0 NEWLINE
        OUT
END
        HALT

PTR     .FILL       x4000
STAR    .FILL       x2A
NEWLINE .FILL       x0A
STRING  .STRINGZ    "INPUT A CHAR: "
        .END
        
; terminate w/ newline
; 

; SENTINEL-TERMINATED LOOP
; STORE PASSWORD IN MEMORY