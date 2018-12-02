; Standard definitions of Mode bits and Interrupt (I & F) flags in PSR s
Len_SVC_Stack EQU 0x100 ;full descending stack
MODE_SVC  EQU 0x13  ;mode for Supervisor mode
MODE_USR   EQU 0x10
I_Bit    EQU 0x80 ; when I bit is set, IRQ is disabled
F_Bit    EQU 0x40 ; when F bit is set, FIQ is disabled
MODE_IRQ  EQU 0x12
MODE_FIQ  EQU 0x11
SRAM    EQU 0X40000000
USR_STACK_SIZE      EQU     0X400
SVC_STACK_SIZE      EQU     0X100
IRQ_STACK_SIZE      EQU     0X200
FIQ_STACK_SIZE      EQU     0X300
 
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
Reset_Addr   DCD Reset_Handler
Undef_Addr   DCD UndefHandler
SWI_Addr   DCD SWIHandler
PAbt_Addr   DCD PAbtHandler
DAbt_Addr   DCD DAbtHandler
		DCD 0
IRQ_Addr   DCD IRQHandler
FIQ_Addr   DCD FIQHandler
;SWIHandler   B SWIHandler
PAbtHandler  B PAbtHandler
DAbtHandler  B DAbtHandler
IRQHandler   B IRQHandler
FIQHandler   B FIQHandler
UndefHandler  B UndefHandler

Reset_Handler
        MSR             CPSR_c, #MODE_IRQ + F_Bit + I_Bit
        LDR             sp, =SRAM + IRQ_STACK_SIZE
        MSR             CPSR_c, #MODE_FIQ + I_Bit + F_Bit
        LDR             sp, =SRAM + FIQ_STACK_SIZE
        MSR             CPSR_c, #MODE_SVC + I_Bit + F_Bit
        LDR             sp, =SRAM + SVC_STACK_SIZE
        MSR             CPSR_c, #MODE_USR
        LDR             sp, =SRAM + USR_STACK_SIZE
        LDR             pc, =user_code

		LDR				pc, =user_code
    
SWIHandler
PINSEL0 EQU 0xE002C000 ;1st, pin fn selection ports
IO0DIR  EQU 0xE0028008 ;2nd, direction
IO0PIN EQU 0xE0028000 ;3rd, GPIO port pin
	 
	 ldr sp,=SRAM + SVC_STACK_SIZE
	 ;subs lr,lr,#4
	 ;push {r0-r10,lr}
	 sub r1,lr,#4
	 ldr r0,[r1]
	 bic r0,r0,#0xff000000

	 ; for led pins
	 ldr r1,=PINSEL0
	 ldr r2,=IO0DIR
	 ldr r3,=IO0PIN
	 
	 mov r4,#0
	 str r4,[r1]
	 
	 mov r4, #0xff00
	 str r4, [r2]
	 
	 ldr r4, =0xF000
	 ldr r5, =0xFF00
	 ldr r6,=0xaa00
	 
	 cmp r0,#2
	 
	 blt	Light0
	 beq	Light1
	 bgt 	Light2
Light0 str	r4,[r3]
	bx lr
Light1 str r5,[r3]
	bx lr
Light2 str r6,[r3]
	bx lr



    END 


