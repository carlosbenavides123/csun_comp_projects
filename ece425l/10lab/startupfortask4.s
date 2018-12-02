Len_SVC_Stack EQU 0x100 
MODE_SVC  EQU 0x13 
MODE_USR   EQU 0x10
I_Bit    EQU 0x80 
F_Bit    EQU 0x40 
MODE_IRQ  EQU 0x12
MODE_FIQ  EQU 0x11
SRAM    EQU 0X40000000
USR_STACK_SIZE      EQU     0X400
SVC_STACK_SIZE      EQU     0X100
IRQ_STACK_SIZE      EQU     0X200
FIQ_STACK_SIZE      EQU     0X300
	
PINSEL0 EQU 0xE002C000 
IO0DIR  EQU 0xE0028008 
IO0PIN EQU 0xE0028000 
EXTINT		EQU		0xE01FC140	;FOR FLAG OF INTERRUPT [1]	

 
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
;IRQHandler   B IRQHandler
;FIQHandler   B FIQHandler
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
SWIHandler

	
FIQHandler
        SUBS lr,lr,#4
        push {r0-r10,lr}
		LDR		r0, =PINSEL0
		LDR		r1, =0X0
		STR		r1, [r0]
		LDR		r0, =IO0DIR
		MOV		r1, #0XFF00
		STR		r1, [r0]	
		LDR		r0, =IO0PIN
		LDR		r1, =0x0F00
		STR		r1, [r0]
		
		LDR		r0, =EXTINT ;clear irq
		LDR		r1, =0x1
		STR		r1, [r0]
        pop {r0-r10,lr}
		movs pc, lr

IRQHandler	
        SUBS lr,lr,#4
		LDR		r0, =PINSEL0
		LDR		r1, =0X0
		STR		r1, [r0]
		LDR		r0, =IO0DIR
		MOV		r1, #0XFF00
		STR		r1, [r0]	
		LDR		r0, =IO0PIN
		LDR		r1, =0x0F00
		STR		r1, [r0]
		
		LDR		r0, =EXTINT ;clear irq
		LDR		r1, =0x1
		STR		r1, [r0]
		movs pc, lr
    END 


