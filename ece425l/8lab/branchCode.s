;GLOBAL user_code
		AREA armDelay, CODE, Readonly
		EXPORT delayfunc
;count to 0xffff
delayfunc		
		SUBS r0,r0,#1	;r7=r7-1
		CMP r0,#0		;check when  r7==0
		BNE delayfunc
		

		BX lr
stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code