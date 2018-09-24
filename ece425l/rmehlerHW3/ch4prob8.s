; Use a keil directive to assign address
; 0x800C to the symbol INTEREST

    AREA Question8, CODE, READONLY

INTEREST EQU 0x800C
    ENTRY

    LDR r1,=INTEREST

stop    B stop
        END 