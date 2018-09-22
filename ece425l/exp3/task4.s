        ;header code/start code
        GLOBAL Reset_Handler
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

task4; clarity
;define the values
X   EQU 0xBF
Y   EQU 0x00112233
;define the registers
;notice we used DCD
X1      DCD 0x40000008
Y1      DCD 0x4000000C
STORE   DCD 0x4000001A

    ENTRY
    LDR R0,=X
    STR R0,X1
    LSL R5, R0,#2
    STR R5,STORE


;footer code/stop code
stop    B stop ;endless loop to make the program hang
        END ;assembler directive to indicate the end of code