; make a factorial...
; requires startup from lab...
        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

    AREA PROG2, CODE, READONLY
    ENTRY
    MOV     R6, #10
    MOV     R7, #1
loop    CMP     R6, #0
    ITTT    GT
    MULGT   r7, r6, r7 
    SUBGT   r6, r6, #1 
    BGT     loop
stop    B   stop
        END
