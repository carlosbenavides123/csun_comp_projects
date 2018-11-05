	GLOBAL user_code
	AREA task1FLASH, CODE, Readonly
	IMPORT delayfunc
	
user_code	
PINSEL0 EQU 0xE002C000 ;1st, pin fn selection ports
IO0DIR  EQU 0xE0028008 ;2nd, direction
IO0SET EQU 0xE0028004 ;set
IO0CLR EQU 0xE002800C ;clear
SRAM_BASE EQU 0x40000000

; use r0 to r3 as volatile registers

  ENTRY
  MOV r0,#0  ;1st, 0 to address
  LDR r1, =PINSEL0
  STR r0,[r1]

  MOV r1,#0xff00  ;2nd, 1 to make it output pin
  LDR r0,=IO0DIR
  STR r1, [r0]

	ldr r4,=0x8000		;task1 goal
	mov r5, #1    		;initialize 0x100 (led 8)
	mov r5, r5, LSL#8
	
	ldr r0,task1
	
	; this loop, for int i = 0x100; i<0xff00; i = i*2
	; r5 is i; r4 is 0xff00
	
	;r8 = IO0CLR
	;r9 = IO0SET
	;r7 is 2, used for temporary multiplying
	;r6 is used for multiplying, then used for r5
	;r5 x 2 => next bit
	;0x100 x 2 => 0x200...etc
	
	ldr r8, = IO0CLR
	ldr r9, = IO0SET
	ldr r10, =0xff00
	
	;first all leds off
	str r10,[r9]
	
task1
	;store into clr
	STR r5,[r8]
	
	ldr r0, =0xffff
	BL delayfunc		; go to delay
	
	CMP r5,r4			; r5 == r4?
	BEQ task2			; if true, exit loop
	
	mov r7,#2			; set up for multiplacation 
	mul r6, r7,r5
	mov r5,r6			;new value for r5
	
	ldr r0, =0xffff
	BL delayfunc		; go to delay
	
	;turn it off
	str r10,[r9]
	b task1

	
task2

stop b stop
	END
