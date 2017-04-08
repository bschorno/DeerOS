JMP Boot

BootMsg DB "Preparing to Load DeerOS 1.0", 0x0A,0x0D,0x0
Print:
LODSB
OR AL,AL
JZ .Printdone

MOV AH,0x0E
INT 0x10
JMP Print

.Printdone:
RET

Boot:
CLI
MOV AX,0x07C0

MOV DS,AX
MOV ES,AX
MOV AX,0x0000
MOV SS,AX
MOV SP,0x07C0
STI

MOV SI,BootMsg
CALL Print
HLT

TIMES 510-($-$$) DB 0
DQ 0xAA55