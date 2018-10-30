
	AREA delay, CODE, READONLY
		EXPORT delayfunc
delayfunc
	; count to 0xffff
	ldr r0,=0xffff
	ldr r1,=0x1
	
	cmp r1,r0; r1 == r0?
	addne r1,r1,#1
	bne cmp
	BX lr
	END