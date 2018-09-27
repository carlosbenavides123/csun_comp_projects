; Calculate the effective address of the following 
; insutrctions if register r3 = 0x4000 and register
; r4 = 0x20
        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

R3ADDRESS EQU 0X4000
R4ADDRESS EQU 0X20

    ENTRY 
    LDR R3, =R3ADDRESS
    LDR R4, =R4ADDRESS

    STRH R9, [R3, R4]
	
	LDR R7, [R3],R4

STOP    B   STOP
        END
