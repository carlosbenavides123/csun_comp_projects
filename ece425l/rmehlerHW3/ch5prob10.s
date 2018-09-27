; What would the register contain
; after executing the following instructions 

        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

R3ADDRESS EQU 0X4800
    ENTRY 

    STR R6, [R3, #12]
    STRB R7, [R3], #4
    LDRH R5, [R3], #8
    LDR R12, [R3,#12]!

STOP    B   STOP
        END
