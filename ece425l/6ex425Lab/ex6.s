		GLOBAL Reset_Handler
		AREA task1PushON, CODE, Readonly
Reset_Handler	;necessary for first line of code
PINSEL0 EQU 0xE002C000	;1st, pin fn selection ports
IO0DIR 	EQU 0xE0028008	;2nd, direction
IO0PIN	EQU 0xE0028000	;3rd, GPIO port pin	
Bit08	EQU 0x100		;1111 1110 0000 0000
Bit09	EQU 0x200		;1111 1101 0000 0000
Bit10	EQU 0x400		;1111 1011 0000 0000
Bit11	EQU 0x800		;1111 0111 0000 0000
Bit12	EQU 0x1000		;1110 1111
Bit13 	EQU 0x2000		;1101 1111
Bit14	EQU 0x4000		;1011
Bit15	EQU 0x8000		;0111
		ENTRY
		MOV r0,#0		;1st, 0 to address (bit 28,29)
		LDR r1, =PINSEL0
		STR r0,[r1]

		MOV r2,#0x000FF00 ;all LEDs off, all as outputs
		LDR r3,=IO0DIR
		STR r2,[r3]
		LDR r5,=IO0PIN		;input pin
		;MOV r4,#0xFF00
		;STR r4,[r5]
		;P0.14 IN
		MOV r2,#0x000BF00 ;2nd, 0 to po.14 make it input pin, output in (8-15)
		LDR r3,=IO0DIR
		STR r2,[r3]
		
		;MOV r4,#0x4000	;read signal, P0.14(bit 14)
		
		;push 1
NP
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit08
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP2
	
		;delay
		LDR r7, =0x1
bb		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb
;push2
NP2
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP2
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit09
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP3	
		
		;delay
		LDR r7, =0x1
bb2		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb2
;push3
NP3
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP3
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit10
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP4
		;delay
		LDR r7, =0x1
bb3		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb3
;push4		
NP4
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP4
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit11
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP5
		;delay
		LDR r7, =0x1
bb4		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb4
;push5
NP5
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP5
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit12
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP6
		;delay
		LDR r7, =0x1
bb5		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb5
;push6
NP6
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP6
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit13
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP7
		;delay
		LDR r7, =0x1
bb6		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb6
;push7
NP7
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP7
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit14
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP8
		;delay
		LDR r7, =0x1
bb7		
		SUBS r7,r7,#1	;r7=r7-1
		CMP r7,#0		;check when  r7==0
		BNE bb7
;push8
NP8
		LDR r6,[r5]
		LDR r8,=0x000BF00				;1011 1111 0000 0000 PO.14:input
		BIC r8,r6,r8
		CMP r8,#0x4000					;when PO.14 on
		;CMP r6,#0x4000					;when PO.14 on

		BEQ NP8
		LDR r2,=0x000FF00 				;PO.14 output & bit 8-15
		STR r2,[r3]
		LDR r6,=Bit15
		;ORR r6,r5,#Bit08				;on
		STR r6,[r5]						;FE00
;		BNE NP8
		
		
		
stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code