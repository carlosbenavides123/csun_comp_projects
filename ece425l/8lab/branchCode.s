
	AREA myDelay, CODE, READONLY
	EXPORT delayfunc

	; count to 0xffff
	ldr r0,=0x10
	ldr r1,=0x1
	POP	{R0,PC}
delayfunc
	cmp r1,r0		; r1 == r0?
	addne r1,r1,#1
	bne delayfunc
	bx lr
	END