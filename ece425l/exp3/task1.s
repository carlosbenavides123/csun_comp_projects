        ;header code/start code
        GLOBAL Reset_Handler
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

task1; clarity
;define the values
X   DCD 0xBF
Y   DCD 0x00112233
;define the registers
;notice we used DCD
X1  EQU 0x40000008
Y1  EQU 0x4000000C

    ENTRY
    LDR R0,=X;val
    LDR R1,=Y;val
	LDR R2,=X1;memory loc
	LDR R3,=Y1;memory loc
    STR R0,[R2]
	STR R1,[R3]

;footer code/stop code
stop    B stop ;endless loop to make the program hang
        END ;assembler directive to indicate the end of code