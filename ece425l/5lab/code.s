  GLOBAL Reset_Handler
  AREA task1FLASH, CODE, Readonly
Reset_Handler ;necessary for first line of code
PINSEL0 EQU 0xE002C000 ;1st, pin fn selection ports
IO0DIR  EQU 0xE0028008 ;2nd, direction
IO0SET EQU 0xE0028004 ;set
IO0CLR EQU 0xE002800C ;clear
  ENTRY
  MOV r0,#0  ;1st, 0 to address
  LDR r1, =PINSEL0
  STR r0,[r1]
  MOV r6,#0xff00  ;2nd, 1 to make it output pin
  LDR r7,=IO0DIR
  STR r6, [r7]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ONN
  MOV r0,#0xFF00 ;on
  LDR r1,=IO0CLR
  STR r0,[r1]
  ;delay
  ;LDR r9, =0x200D
  ;ADD r1, r9,#1
  ;delay
  LDR r7,=0xffff
bb  
  
  SUBS r7,r7,#1
  CMP r7, #0
  
  BNE bb
  
  ;MOV r11, #0xfffff
loop 
  ;LDR r9, =0x200D
  ;ADD r1, r9,#1
  
  MOV r0,#0xFF00 ; on
  LDR r1,=IO0SET
  STR r0,[r1]
  
  LDR r7,=0xffff
bbc   
  SUBS r7,r7,#1
  CMP r7, #0
  
  BNE bbc
  
  B ONN
  ;MOV r2,#0xFF00 ; off
  ;LDR r3,=IO0SET
  ;STR r2,[r3]
  ;SUB r11, r11,#1
  ;CMP r11,#0
  ;BNE loop
  
stop B stop ;endless loop to make program hang
  END  ;assembler directives to indicate the end of code