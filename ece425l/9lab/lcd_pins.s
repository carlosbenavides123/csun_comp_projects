			;GLOBAL user_code
			AREA LCD_Pins, CODE, Readonly

			EXPORT LCD_pins
;user_code
LCD_pins

IO0PIN		EQU	0XE0028000
PINSEL0		EQU 0XE002C000		;P0.15-0
PINSEL1		EQU 0XE002C004		;PO.31-16
PINSEL2		EQU 0XE002C014		;P1.25-16
IO0DIR    	EQU 0xE0028008

LCD_DATA 	EQU 0X00FF0000		;P1.16-P1.23
LCD_RS	 	EQU 0X01000000		;P1.24
LCD_E	 	EQU 0X02000000		;P1.25
LCD_RW	 	EQU 0X00400000		;P0.22
LCD_LIGHT 	EQU 0X40000000		;P0.30
			ENTRY

			;backlight (PO.30 & PO.22)
			ldr r0,=0X30003000	;29:28	m=n-16 ...so n(30)=[2m+1:2m]=[29:28] & [13:12]
			LDR r1, =PINSEL1
			BIC R0,R1,R0
			STR r0,[r1]
			
			LDR R0,=IO0DIR
			LDR R1,=0x40400000	;bit 30, 22 (make output pin)
			STR R1,[R0]
			
			LDR r1,=IO0PIN
			LDR r4,=0x40400000
			STR r4,[r1]		
;;;;;;;;;;;;
			;(PO.22)RW
;			MOV r0,#0X3000		;[13:12] m=6..so n(22)=[2m+1:2m]=[13:12]		
;			LDR r1, =PINSEL1
;			BIC R0,R1,R0
;			STR r0,[r1]
;			
;			LDR R0,=IO0DIR
;			LDR R1,=LCD_RW		;bit 22 (make output pin)
;			STR R1,[R0]
;			
			LDR r9,=IO0PIN
			LDR r6,=LCD_RW
			;STR r6,[r9]
;;;;;;;;;;;;
;			;clear bit 3 of PINSEL2
;			MOV r0,#0X4				
;			LDR r1, =PINSEL2
;			BIC R0,R1,R0
;			STR r0,[r1]
;;;;;;;;;;;;
;			;(P1.16-P1.23)
;			MOV r0,#0XFF0000	; or do i use same equation as PINSEL1???		
;			LDR r1, =PINSEL2
;			BIC R0,R1,R0
;			STR r0,[r1]
;			
;			LDR R0,=IO0DIR
;			LDR R1,=LCD_DATA	;bit 16-23 (make output pin)
;			STR R1,[R0]
;			
;			LDR r1,=IO0PIN
;			LDR r4,=LCD_DATA
;			STR r4,[r1]
;;;;;;;;;;;
;			;(P1.24)RS
;			MOV r0,#0X1000000	; or do i use same equation as PINSEL1???		
;			LDR r1, =PINSEL2
;			BIC R0,R1,R0
;			STR r0,[r1]
;			
;			LDR R0,=IO0DIR
;			LDR R1,=LCD_RS	;bit 24 (make output pin)
;			STR R1,[R0]
;			
;			LDR r9,=IO0PIN
;			LDR r7,=LCD_RS
;			;STR r7,[r9]
;;;;;;;;;;;
;			;(P1.25)
;			MOV r0,#0X2000000	; or do i use same equation as PINSEL1???		
;			LDR r1, =PINSEL2
;			BIC R0,R1,R0
;			STR r0,[r1]
;			
;			LDR R0,=IO0DIR
;			LDR R1,=LCD_E	;bit 25 (make output pin)
;			STR R1,[R0]
;			
;			LDR r1,=IO0PIN
;			LDR r5,=LCD_E
;			;STR r5,[r1]
;			
;			
			BX lr			;branch exchange

stop		B	stop	;endless loop to make program hang
			END		;assembler directives to indicate the end of code