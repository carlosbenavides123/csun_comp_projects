		AREA prelab, CODE, Readonly
        IMPORT delay
        IMPORT Enable
		IMPORT RS
		IMPORT RW
        IMPORT Disable

		EXPORT LCD_cmd

;use r4 as address 

LCD_cmd		
		;expect data r0
LCD_DATA    EQU 0x00FF0000 ; P1.16 - P1.23
		push {r5-r9}
		ldr r10, =LCD_DATA

		LDMFD r10,{r1-r9}
		STMFD r0, {r1-r9}
		;ldr r4, =LCD_DATA
		;str r0,[r4]
		pop {r5-r9}
		BL Disable
		mov r10, #0
		BL RS
		BL RW

		BL Enable
		PUSH {r0}
		mov r0,#0xff
		BL delay
		
		BL Disable
		ldr r0, =0xffff
		BL delay
		POP {r0}
		BX lr

LCD_char
LCD_DATA2    EQU 0x00FF0000 ; P1.16 - P1.23
		ldr r4, =LCD_DATA2
		str r0,[r4]

		mov r10, #1
		BL RS

		mov r10, #1
		BL RW
		
		BL Enable

		PUSH {r0}
		ldr r0, =0xff
		BL delay

		BL Disable
		ldr r0, =0xffff
		BL delay
		POP {r0}

		BX lr

	
		BX lr
stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code