.ORIG x3000

        LEA R0, STRING
        PUTS
        GETC
        LD R0, PSEUDO
        OUT
        HALT

PSEUDO  .FILL       x2A
STRING  .STRINGZ    "INPUT A CHAR: "
        .END