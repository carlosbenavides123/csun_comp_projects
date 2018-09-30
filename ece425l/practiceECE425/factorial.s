; make a factorial...
; requires startup from lab...
        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

    AREA PROG2, CODE, READONLY
    ENTRY
    MOV     R6, #10 ; FOR I TO R6
    MOV     R7, #2  ; BEGINNING OF FACTORIAL VAL
	
	MULGT R7,R6,R7

loop    CMP R6,#0   ; R6 == 0?
        MULGT R7,R6,R7 ; if cmp above is true
        SUBGT R6,R6,#1 ; then do these
        BGT   loop

stop    B   stop
        END
