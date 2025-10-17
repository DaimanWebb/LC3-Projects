.ORIG x3000
    LEA R0, MESG_TO_PRINT
    PUTS
    HALT

MESG_TO_PRINT   .STRINGZ    "Hello, World!"
                .END