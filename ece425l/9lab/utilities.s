		AREA utilities, CODE, Readonly
        IMPORT delay
        IMPORT LCD_cmd
		EXPORT Enable
		EXPORT RS
		EXPORT RW
        EXPORT Disable
        EXPORT LCD_init
        EXPORT LCD_pins

PINSEL0 EQU 0xE002C000 ;1st, pin fn selection ports   
PINSEL2 EQU 0xE002C014; for lcd interface, P1.25-P1.16
IO0DIR  EQU 0xE0028008 ;2nd, direction
IO0SET EQU 0xE0028004 ;set
IO0CLR EQU 0xE002800C ;clear
SRAM_BASE EQU 0x40000000

;data
LCD_DATA    EQU 0x00FF0000 ; P1.16 - P1.23
LCD_RS      EQU 0x01000000 ; p1.24
LCD_E       EQU 0x02000000 ; p1.25
LCD_RW      EQU 0x00400000 ; P0.22
LCD_LIGHT   EQU 0x40000000 ; P0.30

;use r5-r19 as EQU 

LCD_pins

    LDR r1, =PINSEL0
    LDR r0, [r1] ;read the current contents of PINSEL0
    BIC r0, r0, #0xC0000000 ;modify the contents by clearing bits [31:30]
    STR r0, [r1] ;write the value back to PINSEL0
    
    ; use read-modify-write ? 
    ; lcd uses pins p1.25-p1.16
    ; bit 3 needs to be cleared
    LDR r1, =PINSEL2 
    LDR r0, [r1]
    BIC r0, r0, #0x4;0100
    STR r0, [r1]

    ;test this code
    ;VMRS    r10,=PINSEL2             ; copy FPSCR into the general-purpose r10
    ;BIC r0, r0, #0x4;0100
    ;VMSR    =PINSEL2 ,r10     

    ;make output pins
    ldr r1,=0x3fff0000; pin 16 to 30?
    LDR r0,=IO0DIR
    STR r1, [r0]

    LDR r5, =LCD_DATA
    LDR r6, =LCD_RS
    LDR r7, =LCD_E
    LDR r8, =LCD_RW
    LDR r9, =LCD_LIGHT
    BX lr

;use r10 as temp val

Enable  ;r7
    mov r10, #0x1
    str r10, [r7]
    BX lr

RS ;expect data, r0-r3
    ;rs is r6
    str r10,[r6]
    BX lr

RW; expect data, r0-r3
    ;rw is r8
    str r10,[r8]
    BX lr

Disable
    ;Enable is r7
    mov r10,#0
    str r10,[r7]
    BX lr

LCD_init
    mov r1,#1
    cmp r1,#3
    beq leave
    mov r0,#0x30
    B LCD_cmd
    addne r1,r1,#1
    bne LCD_init
leave 
	BX lr


stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code