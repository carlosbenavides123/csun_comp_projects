        ;header code/start code
        GLOBAL Reset_Handler
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

task3; clarity
;define the values
X   EQU 0xBF
Y   EQU 0x00112233
;define the registers
;notice we used DCD
X1  EQU 0x40000008
Y1  EQU 0x4000000C
STORE EQU 0x40000018

    ENTRY
    LDR R0,=X
	LDR R8,=X1
    STR R0,[R8]
	LDR R7, =STORE
    ROR R1, R0,#4
    STR R1,[R7]


;footer code/stop code
stop    B stop ;endless loop to make the program hang
        END ;assembler directive to indicate the end of code