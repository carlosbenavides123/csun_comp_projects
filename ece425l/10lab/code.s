	GLOBAL user_code
	AREA task1FLASH, CODE, Readonly
	
user_code	
	SWI #0x255

stop b stop
	END