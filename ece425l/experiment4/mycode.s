   GLOBAL Reset_Handler
   AREA mycode, CODE, Readonly
Reset_Handler
;LPC2148 uses pin P0.8 as transmitting
;GPIO
;PIN SELECT 0
;CONTROLS FUNCTION OF PORT 0.0-0.15
PINSEL0     EQU 0XE002C000 ; PORT 0
IO0DIR   EQU 0xE0028008
IO0PIN   EQU 0xE0028000
 
   ENTRY
 
   MOV R0,#0
   LDR R1, =PINSEL0 
   STR R0, [R1]
   
   MOV R7, #0XFF00; change these guys for selection of led turning on
   LDR R5, =IO0DIR; ff00 => 1111 1111 0000 0000 means light up pins 8 to 15
   STR R7,[R5]
   MOV r0, #0xAA00; light up  1010 1010, or alternating
   LDR r1, =IO0PIN
   STR r0, [r1]
 
stop        B   stop    
            END