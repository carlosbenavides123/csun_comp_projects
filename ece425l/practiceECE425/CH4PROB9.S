        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

;What constant would be created if the following operators are used with a
;DCD directive? For example,
;MASK DCD 0x5F:ROL:3
;a. 0x5F:SHR:2
;b. 0x5F:AND:0xFC
;c. 0x5F:EOR:0xFF
;d. 0x5F:SHL:12

MASKA 	DCD 	-0x5F ; ffffffA1
MASKB 	DCD 	-0x5F:ROL:3 ;fffffD0F recall we add 1's due to sign bit

MASKC 	DCD 	0x5F:SHR:2 ;17 in hex
;MASKZ	DCD		-0x5F:SHL:2 ; CANT SHIFT RIGHT NEGATIVES!

; B
MASKD 	DCD 	0X5F:AND:0XFC 
; 0101 1111 AND 1111 1100 -> 0101 1100
; WHAT ABOUT NEG?
MASKE 	DCD 	-0X5F:AND:-0XFC
; ANS FFFFFF00

; C 
MASKF 	DCD		0X5F:EOR:0XFF
; 0101 1111 EOR 1111 1111 -> 1010 0000
; NEGATIVE?
MASKG 	DCD 	-0X5F:EOR:-0XFF

	ENTRY
	LDR R0, MASKA
	LDR R1, MASKB
	LDR R2, MASKC
	
	LDR R3, MASKD
	LDR R4, MASKE
	
	LDR R5, MASKF
	LDR R6, MASKG 

stop    B   stop
        END