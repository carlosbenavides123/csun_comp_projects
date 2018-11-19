		AREA prelab, CODE, Readonly
        IMPORT delay
		IMPORT LCD_pins
        ;IMPORT Disable
		;IMPORT LCD_init
		;IMPORT RS
		;IMPORT RW
		;IMPORT Enable
		EXPORT LCD_cmd
		

;use r4 as address 

LCD_cmd		

;D[0:7] (PO.7-PO.14)
			ldr r0,=0X7f80	
			LDR r1, =PINSEL0
			BIC R0,R1,R0
			STR r0,[r1]
			
			LDR R0,=IO0DIR
			LDR R1,=0x7f80
			STR R1,[R0]
			
			LDR r1,=IO0PIN
			LDR r4,=0x7f80
			STR r4,[r1]		

	push {lr}
	;rs = 0
	mov r10, #0
	;BL RS
	;r/w = 0
	mov r10, #0
	BL RS					;(2)
	BL RW					;(2)
	BL Disable				;(2)
	;delay					
	ldr r0, =0x3c	;60us	;(2)
	BL delay				;(2)
	BL Enable				;(3)
	ldr r0, =0x3c	;60us	;(3)
	BL delay				;(3)
	BL Disable				;(4)
	ldr r0,=0x190	;40us	;(4)

	
	pop {pc}
	
Enable 
	push {lr}
	mov r10,#1
	str r10,[r5]
	pop {pc}
	
Disable
	push {lr}
	mov r10, #0
	str r10,[r5]
	pop {pc}

	
RS ;expect data,r0
    ;rs is r6
	;LDR r9,=IO0PIN

	push {lr}
	LDR r11,[r9]
	BIC r11,r11,r7
    str r11,[r9]
    pop {pc}

RW; expect data, r0
    ;rw is r8
	push {lr}
	LDR r11,[r9]
	BIC r11,r11,r6			;make RW=0
    str r11,[r9]
    pop {pc}

;PREVIOUS CODE (11/5)
;		;expect data r0
;LCD_DATA    EQU 0x00FF0000 ; P1.16 - P1.23
;		push {r5-r9}
;		ldr r10, =LCD_DATA

;		

;		LDM r10,{r1-r9}
;		STM r0, {r1-r9}
;		;ldr r4, =LCD_DATA
;		;str r0,[r4]
;		pop {r5-r9}
;		BL Disable
;		mov r10, #0
;		BL RS
;		BL RW

;		BL Enable
;		PUSH {r0}
;		mov r0,#0xff
;		BL delay
;		
;		BL Disable
;		ldr r0, =0xffff
;		BL delay
;		POP {r0}
;		BX lr

;LCD_char
;LCD_DATA2    EQU 0x00FF0000 ; P1.16 - P1.23
;		ldr r4, =LCD_DATA2
;		str r0,[r4]

;		mov r10, #1
;		BL RS

;		mov r10, #1
;		BL RW
;		
;		BL Enable

;		PUSH {r0}
;		ldr r0, =0xff
;		BL delay

;		BL Disable
;		ldr r0, =0xffff
;		BL delay
;		POP {r0}

;		BX lr

	
		BX lr
stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code