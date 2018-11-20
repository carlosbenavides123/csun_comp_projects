
; Standard definitions of Mode bits and Interrupt (I & F) flags in PSR s

Len_SVC_Stack	EQU	0x100	;full descending stack
Mode_SVC		EQU	0x13 	;mode for Supervisor mode
Mode_USR 		EQU 0x10 
I_Bit 			EQU 0x80 ; when I bit is set, IRQ is disabled 
F_Bit 			EQU 0x40 ; when F bit is set, FIQ is disabled

Mode_IRQ		EQU 0x18
Mode_FIQ		EQU	0x1C

SRAM 			EQU 0X40000000 

;definitions for SVC
SVC_Stack_size	EQU	0x100
SVC_Stack_top	EQU	SRAM+SVC_Stack_size

;definitions of FIQ
FIQ_Stack_Size	EQU	0x200
FIQ_Stack_Top	EQU	SRAM+FIQ_Stack_Size

;definition of irq
IRQ_Stack_Size	EQU	0x300
IRQ_Stack_top	EQU SRAM+IRQ_Stack_Size

;Defintions of User Mode Stack and Size
USR_Stack_Size 	EQU 0x00000400 
USR_Stack_Top 	EQU SRAM+USR_Stack_Size
	
				AREA reset , CODE, READONLY ;make sure RESET i s capitalized
				ENTRY
				ARM
				IMPORT user_code
VECTORS
				LDR PC,Reset_Addr
				LDR PC,Undef_Addr
				LDR PC,SWI_Addr
				LDR PC,PAbt_Addr
				LDR PC,DAbt_Addr
				NOP
				LDR PC,IRQ_Addr
				LDR PC,FIQ_Addr
Reset_Addr 		DCD Reset_Handler
Undef_Addr 		DCD UndefHandler
SWI_Addr 		DCD SWIHandler
PAbt_Addr 		DCD PAbtHandler
DAbt_Addr 		DCD DAbtHandler
				DCD 0
IRQ_Addr 		DCD IRQHandler
FIQ_Addr 		DCD FIQHandler
;SWIHandler 		B SWIHandler
PAbtHandler 	B PAbtHandler
DAbtHandler 	B DAbtHandler
IRQHandler 		B IRQHandler
FIQHandler 		B FIQHandler
UndefHandler 	B UndefHandler

Reset_Handler

	; init fiq
	msr cpsr_c, #(Mode_FIQ+I_Bit+F_Bit)
	;ldr sp,=FIQ_Stack_Top

	; init irq
	msr cpsr_c,#(Mode_IRQ+I_Bit+F_Bit)
	;ldr sp,=IRQ_Stack_top

	; init svc
	msr cpsr_c,#(Mode_SVC+I_Bit+F_Bit)

	;initialize the stack, full descending
				LDR SP, =USR_Stack_Top
	; Enter User Mode with interrupts enabled
				MOV r14, #Mode_USR
				BIC r14,r14,#(I_Bit+F_Bit)
				MSR cpsr_c, r14
;load start address of user code into PC
				LDR pc, =user_code
				
SWIHandler
PINSEL0 EQU 0xE002C000	;1st, pin fn selection ports
IO0DIR 	EQU 0xE0028008	;2nd, direction
IO0PIN	EQU 0xE0028000	;3rd, GPIO port pin	

	ldr sp,=SVC_Stack_top
	push {r0-r10}
	sub r0,lr,#4

	; r1 = pinsel0 r2 = io0dir r3 = io0pin
	ldr r1,=PINSEL0
	ldr r2,=IO0DIR
	ldr r3,=IO0PIN

	mov r4,#0
	str r4,[r3]

	

	
	movs pc,lr
				END	