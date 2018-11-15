;GLOBAL user_code
		AREA armDelay, CODE, Readonly
		EXPORT delay
; r0 is passed in as delay timing
delay		
		SUBS r0,r0,#1	;r0=r0-1
		CMP r0,#0		;check when  r0==0
		BNE delay
		

		BX lr
stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code