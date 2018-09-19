	AREA Prog2, CODE, READONLY
	
	ENTRY
	
	MOV r6, #10 ; load n into r6
	MOV r7, #1 ; if n = 10, at least n !=1
loop CMP r6, #0 ; does r6 = 0?
	MULGT r7, r6, r7 ;store r7, if r6 > f7
	SUBGT r6, r6, #1; store into r6, if r6 != 0
	BGT loop ; branch to loop, if condition is met else go to stop
stop b stop
	END