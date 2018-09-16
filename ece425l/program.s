        GLOBAL		Reset_Handler
        AREA 		mycode,CODE,Readonly
Reset_Handler	;label neccessary?
		
stop 		B	 stop ;endless loop to make the program hang
			END ;assembler directive to indicate the end of code