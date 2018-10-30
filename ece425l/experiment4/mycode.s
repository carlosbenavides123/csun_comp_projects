  GLOBAL Reset_Handler
  AREA task1FLASH, CODE, Readonly
Reset_Handler ;necessary for first line of code
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

mov r0, #1    
move r2, #5     ; r0 = 0000 0000 0000 0000 0000 0000 0000 0001
mov r3, r0, LSLr2

stop b stop
	END
