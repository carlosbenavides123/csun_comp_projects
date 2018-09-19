	AREA Prob10, CODE, READONLY
	
	ENTRY
var EQU 0x1
	LDR r3, =var
	LDR r6, =var
	LDR r8, =var
	LDR r9, =var
	LDR r10, =var
	MOVS r6, r6, LSL #5; store into r6, multiply r6 val by 2^5
	ADD r9, r8, r8, LSL #2 ;store into r9, take the val of 2nd arg, multiply by 2^2, add both args 
	RSB r10, r9, r3, LSL #3;reverse subtraction, take 2nd arg multiply it by 2^3 subtract first arg
stop B stop
	END