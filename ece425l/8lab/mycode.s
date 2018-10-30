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

	ldr r4,=0xff00		;task1 goal
	mov r5, #1    		;initialize 0x100 (led 8)
	mov r5, r5, LSL#8
	
	ldr r0,task1
	
	; this loop, for int i = 0x100; i<0xff00; i = i*2
	; r5 is i; r4 is 0xff00
task1
	PUSH 	{r0,LR}      ;Save values in the stack
	BL delayfunc		; go to delay
	CMP r5,r4			; r5 == r4?
	BEQ task2			; if true, exit loop
	mov r2,#2			; set up for multiplacation 
	mul r1, r0,r2
	mov r5,r1			;new value for r5
	
	; now light up corresponding led
	; use r6 as clr
	ldr r6, =IO0CLR ; light up board
	str r5,[r6]

	
task2

stop b stop
	END
