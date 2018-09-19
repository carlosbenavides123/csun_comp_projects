	AREA Prog3, CODE, READONLY
	
	ENTRY

	LDR r0, =0xF631024C 
	LDR r1, =0x17539ABD
	EOR r0, r0, r1 ; store r0, result of r0 XOR r1
	EOR r1, r0, r1; store r1, result of r1 XOR r0
	EOR r0, r0, r1; store r0, result of r0 XOR r1
	
stop B stop ; stop program
	
	END