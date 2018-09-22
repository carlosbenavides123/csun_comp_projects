        ;header code/start code
        GLOBAL Reset_Handler
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

task2; clarity
;define the values
X   EQU 0xBF
Y   EQU 0x00112233
;define the registers
;notice we used DCD
X1  DCD 0x40000008
Y1  DCD 0x4000000C

SECOND  DCD 0X44663377
THIRD   DCD 0X00112233
ADDSUM  DCD 0X40000010
SUBSUM  DCD 0X40000014

    ENTRY
    LDR R0,=X
    LDR R1,=Y
    STR R0,X1
    STR R1,Y1

    LDR R0,SECOND
    LDR R6,THIRD
    ADD R3,R1,R0;r1+r0 = r3
    STR R3,ADDSUM
    SUB R4,R5,R6;r5+r6 = r4
    STR R4,SUBSUM


;footer code/stop code
stop    B stop ;endless loop to make the program hang
        END ;assembler directive to indicate the end of code