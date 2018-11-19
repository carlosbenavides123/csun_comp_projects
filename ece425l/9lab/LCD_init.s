		AREA utilities, CODE, Readonly
        IMPORT delay
        IMPORT LCD_cmd
		EXPORT Enable
		EXPORT RS
		EXPORT RW
        EXPORT Disable
        EXPORT LCD_init
        EXPORT LCD_pins
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
			

			MOV r0,#0X30000000	;29:28	m=n-16 ...so n(30)=[2m+1:2m]=[29:28]
			LDR r1, =PINSEL1
			BIC R0,R1,R0
			STR r0,[r1]
			
			LDR R0,=IO0DIR
			LDR R1,=LCD_LIGHT	;bit 30 (make output pin)
			STR R1,[R0]
			
			LDR r1,=IO0PIN
			LDR r4,=LCD_LIGHT
			STR r4,[r1]	
			
			;CLEAR BIT 3
			LDR r1, =PINSEL2 
			LDR r0, [r1]
			BIC r0, r0, #0x4;0100
			STR r0, [r1]
			
			LDR r5, =LCD_DATA
			LDR r6, =LCD_RS
			LDR r7, =LCD_E
			LDR r8, =LCD_RW
			LDR r9, =LCD_LIGHT
			BX lr
			   

;    ;make output pins
;    ldr r1,=0x3fff0000; pin 16 to 30?
;    LDR r0,=IO0DIR
;    STR r1, [r0]



;use r10 as temp val

Enable  ;r7
    mov r10, #0x1
    str r10, [r7]
    BX lr

RS ;expect data, r0-r3
    ;rs is r6
    str r10,[r6]
    BX lr

RW; expect data, r0-r3
    ;rw is r8
    str r10,[r8]
    BX lr

Disable
    ;Enable is r7
    mov r10,#0
    str r10,[r7]
    BX lr

LCD_init
	mov r10,#0
	BL RW
	BL RS
	BL Disable
    mov r1,#1
    cmp r1,#3
    beq leave
    mov r0,#0x30
    B LCD_cmd
    addne r1,r1,#1
    bne LCD_init
leave 
	BX lr


stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code