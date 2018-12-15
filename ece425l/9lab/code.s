			GLOBAL    user_code
			AREA    Test,CODE,Readonly
				
baser 		equ 	0x40000000; base address

pinsel0 	equ 	0xE002C000; sets up adresses for the pins GPIO
pinsel1 	equ 	0xE002C004
pinsel2 	equ 	0xE002C014
	
IO0PIN 		equ 	0xE0028000; values for pins
IO1PIN 		equ 	0xE0028010

	
IO0DIR		EQU		0xE0028008
IO1DIR		EQU		0xE0028018
	
IO0SET 		EQU 	0xE0028004 
IO0CLR 		EQU 	0xE002800C
	
IO1SET 		EQU		0xE0028014 
IO1CLR 		EQU 	0xE002801C

	
LCD_DATA1  	EQU 	0x00300000
LCD_DATA2 	EQU 	0x00380000
LCD_DATA3 	EQU 	0x000C0000
LCD_DATA4 	EQU 	0x00010000
LCD_DATA5 	EQU 	0x00060000
LCD_LIGHT 	EQU 	0x40000000 ; P0.30
	
LCD_DATA 	EQU 	0x00410000 ; P1.16 - P1.23
LCD_RS 		EQU 	0x01000000 ; p1.24
LCD_E 		EQU 	0x02000000 ; p1.25
LCD_RW 		EQU 	0x00400000 ; P0.22
	
	
com 		equ 	0x00880000
char1 		equ 	0x00510000; Q
com2 		equ 	0x00C00000
char2 		equ 	0x00480000; H
char3 		equ 	0x004F0000; O
char4		equ		0x004C0000; L
char5		equ		0x00490000; I
char6		equ		0x00430000; D
char7		equ		0x00410000; A
char8		equ		0x00590000; Y
	
char9 		equ		0x00500000;	P	
	
clr1 		equ 	0x30003000
	
			ENTRY	
user_code   
	    ldr r10, =LCD_LIGHT
		ldr r1, =pinsel1
		ldr r2, =pinsel2
		ldr r3, =50000
		bl lcd_pins; initiializes the pins as GPIO
		ldr r1, =IO0PIN
		ldr r2, =IO1PIN
		ldr r3, =50000
		bl lcd_int; initializes the LCD
		ldr r3, =50000
		bl display; displays the string
STOP		B 		STOP
			
			
lcd_pins
    ldr r0, [r1]
    ldr r3, =clr1
    bic r0,r0, r3; clears bits 12 13 28 29
    str r0, [r1]; sets the desired pins to GPIO
    ldr r3, =IO0DIR
    ldr r0, =0xFFFFFFFF; all ones
    str r0, [r3]; sets the direction
    ldr r0, [r2]
    bic r0,r0, #0x00000008; clears bit 3
    str r0, [r2]; set as GPIO
    ldr r3, =IO1DIR 
    ldr r0, =0xFFFFFFFF
    str r0, [r3]
    bx LR
			
			
lcd_int
    stmia sp!, {r3-r10,lr}
    mov r8, #0
    orr r8, r8, r10
    str r8, [r1];CLR PINSEL0
    str r8, [r2];CLR PINSEL1
    ldr r8, =LCD_DATA1
    bl command;sends data
    ldr r8, =LCD_DATA2
    bl command
    ldr r8, =LCD_DATA3
    bl command
    ldr r8, =LCD_DATA4
    bl command
    ldr r8, =LCD_DATA5
    bl command
    ; the LCD has been initialized
    ldmdb sp!,{r3-r10,pc}
	
	
command
    stmia sp!,{r3-r9,lr}; 
    ldr r4, =LCD_E
    orr r5,r8,r4
    str r8, [r2];stores data
    bl subr
    str r5, [r2];turns on enable
    bl subr; wait
    str r8, [r2];turns off enable
    bl subr; wait
    ldmdb sp!,{r3-r9,pc}
	
character
    stmia sp!,{r3-r9,lr};
    ldr r5, =LCD_RS
    ldr r4, =LCD_E
    str r9, [r2] ;stor data character
    orr r5, r5, r9;set rs to 1
    str r5, [r2]
    bl subr
    orr r6, r5,r4
    str r6, [r2]; enable e
    bl subr
    str r5, [r2]; disable e
    bl subr
    ldmdb sp!,{r3-r9,pc}
	
display
    stmia sp!, {r3,lr}
    ldr r8, =com
    bl command; cursor position
    ldr r9, =char2 ;H
    bl character;
	ldr r9, =char7 ;A
    bl character;
	ldr r9, =char9 ;P
    bl character;
	ldr r9, =char9 ;P
    bl character;
	ldr r9, =char8 ;Y
    bl character;
    ldr r8, =com2
    bl command; cursor position
    ldr r9, =char2	;H
    bl character;
	ldr r9, =char3	;O
	bl character;
	ldr r9, =char4	;L
	bl character;	
	ldr r9, =char5	;I
	bl character;
	ldr r9, =char6	;D
	bl character;
	ldr r9, =char7	;A
	bl character;
	ldr r9, =char8	;Y
	bl character;
    ldmdb sp!,{r3,pc}
	
subr
    stmia sp!, {r3,lr}
	ldr	  r3,=0xFFFF
	;ldr   r3,=0x1
DelayOn 
	SUBS	r3,r3,#1
	BNE		DelayOn
    ldmdb sp!,{r3,pc}
	

		    END