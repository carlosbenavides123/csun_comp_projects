		GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement
		
TABLE 	DCD 0xFEBBAAAA, 0x12340000, 0x88881111
		DCD 0x00000013, 0x80808080, 0xFFFF0000
		ENTRY
			
	LDR r0, =TABLE
	
	LDR R3, [R0], #4 ; step 4 bits because the table is a word length
	LDR R4, [R0], #4 ; if it was bytes, step 1
	ADD R5, R4, R3   ; if it was hw, step 2 
	LDR R6, [R0], #4 ; notice how we are doing post index
	LDR R7, [R0], #4
	LDR R8, [R0], #4
	LDR R9, [R0], #4
	
	ADD R5, R5, R6   ; add up all, put the result in r5
	ADD R5, R5, R7
	ADD R5, R5, R8
	ADD R5, R5, R9
		
stop	B	stop
	END
	