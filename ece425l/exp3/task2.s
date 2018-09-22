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
X1  EQU 0x40000008
Y1  EQU 0x4000000C

SECOND  EQU 0X44663377
THIRD   EQU 0X00112233
ADDSUM  EQU 0X40000010
SUBSUM  EQU 0X40000014

    ENTRY
	LDR R0,=X;val
    LDR R1,=Y;val
	LDR R2,=X1;memory loc
	LDR R3,=Y1;memory loc
    STR R0,[R2]
	STR R1,[R3]

	;TASK2 - ADD
	;ADD 0XBF, 0x00112233
	LDR R2,=ADDSUM;memory loc
    ADD R4,R0,R1
	STR R4,[R2]
	
	;TASK2 - SUBTRACT
	;SUBTRACT
	;0x44663377-0x00112233
	LDR R3,=SUBSUM;memory loc
	LDR R5, =SECOND
	LDR R6, =THIRD
    SUB R7,R5,R6
    STR R7,[R3]

;footer code/stop code
stop    B stop ;endless loop to make the program hang
        END ;assembler directive to indicate the end of code