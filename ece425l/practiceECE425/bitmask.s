        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

;Create a mask (bit pattern) in memory using the DCD directive (Keil) and
;the SHL and OR operators for the following cases. Repeat the exercise using
;the .word directive (CCS) and the << and | operators. Remember that bit 31
;is the most significant bit of a word and bit 0 is the least significant bit.

; a
; The upper two bytes of the word are 0xFFEE and the least significant
; bit is set.
MASKA DCD (0xFFEE:SHL:16):OR:1 

; b
; Bits 17 and 16 are set, and the least significant byte of the word is 0x8F.
MASKB DCD (0x8F):OR:(3:SHL:16)
; c
; Bits 15 and 13 are set (hint: do this with two SHL directives).
MASKC DCD (1:SHL:13):OR:(1:SHL:15)

; d 
; Bits 31 and 23 are set.
MASKD DCD (1:SHL:31):OR:(1:SHL:23)

    AREA PROG2, CODE, READONLY
    ENTRY

    ldr r2, =0xAC
	ldr r3, =0xA3
	orr r4,r3,r2
	LDR R0, MASKA
	LDR R7,MASKB
	LDR R8, MASKC
		

stop    B   stop
        END
