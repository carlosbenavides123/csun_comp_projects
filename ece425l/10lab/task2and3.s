 GLOBAL user_code
 AREA task1FLASH, CODE, Readonly
 
user_code 
	 SWI #1
	  BL delay
	 SWI #2
	  BL delay
	 SWI #3
	  BL delay

 
delay
	ldr r10,=0x2
loop	subs r10,r10,#1
	bne loop
	bx lr
stop b stop
 END
