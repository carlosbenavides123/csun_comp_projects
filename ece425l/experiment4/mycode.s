    GLOBAL Reset_Handler
    AREA mycode, CODE, Readonly

Reset_Handler

;LPC2148 uses pin P0.8 as transmitting
;GPIO
;PIN SELECT 0
PINSEL0     EQU 0XE002C000 ; PORT 0
IO0DIR		EQU 0XE0028008

    MOV R0,#0
    LDR R1, =PINSEL0 
    STR R0, [R1]
	
	;write a 1 into regist IO0DIR
	MOV R2, #1
	LDR R3, =IO0DIR 
	STR R2, [R3]
	
;send 1 or 0
IO0PIN EQU 0xE0028000
	MOV r0, #0x00000300
	LDR r1, =IO0PIN
	STR r0, [r1]
	
stop        B   stop    
            END