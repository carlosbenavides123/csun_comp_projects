; Use a keil directive to assign register r6 
; to the name bouncer

    AREA Question3, CODE, READONLY

bouncer RN	6;bouncer is referred as r6
    ENTRY

    LDR bouncer,=0x243;load this number into r6

stop    B stop
        END 