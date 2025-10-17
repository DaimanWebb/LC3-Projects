.ORIG x3000
; LEA R2, PTR
; ldr r1, r2, #0
; ld r2, ptr
; ldr r1, r2, #0
; HALT
LDI R1, ptr         ; MEM[MEM[PTR]] = PTR -> x038C -> xE002
PTR .FILL x038C
HALT 
.END