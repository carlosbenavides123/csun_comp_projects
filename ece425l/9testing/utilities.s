	AREA utilities, CODE, Readonly
	EXPORT init_light
	EXPORT Enable
	EXPORT Disable
	EXPORT RS
	EXPORT RW
	EXPORT LCD_cmd
	EXPORT init_registers
	IMPORT delay

PINSEL0 EQU 0xE002C000 ;1st, pin fn selection ports   
PINSEL1		EQU 0XE002C004		;PO.31-16
PINSEL2 EQU 0xE002C014; for lcd interface, P1.25-P1.16
IO0PIN		EQU	0XE0028000
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
	
init_light
	push {lr}
	mov r0, #0x30000000
	ldr r1, =PINSEL1
	BIC R0,R1,R0
	STR r0,[r1]
	
	LDR R0,=IO0DIR
	LDR R1,=LCD_LIGHT
	STR R1,[R0]
	
	LDR r1,=IO0PIN
	LDR r4,=LCD_LIGHT
	STR r4,[r1]
	pop {pc}

init_registers
	push {lr}

    ;LDR r1, =PINSEL0
    ;LDR r0, [r1] ;read the current contents of PINSEL0
    ;BIC r0, r0, #0xC0000000 ;modify the contents by clearing bits [31:30]
    ;STR r0, [r1] ;write the value back to PINSEL0
    ;
    ;; use read-modify-write ? 
    ;; lcd uses pins p1.25-p1.16
    ;; bit 3 needs to be cleared
    ;LDR r1, =PINSEL2 
    ;LDR r0, [r1]
    ;BIC r0, r0, #0x4;0100
    ;STR r0, [r1] 

    ;make output pins
    ;ldr r1,=0x3fff0000; pin 16 to 30?
    ; maybe this guy
	
	ldr r1,=PINSEL0
	mov r0, #0
	str r0,[r1]
	
    ldr r1,=0x00ff3400
    LDR r0,=IO0DIR
    STR r1, [r0]
	
	ldr r1,=0x00ff3400
    LDR r0,=IO0CLR
    STR r1, [r0]

    LDR r5, =LCD_DATA
    LDR r6, =LCD_RS
    LDR r7, =LCD_E
    LDR r8, =LCD_RW
    LDR r9, =LCD_LIGHT
	pop {pc}


LCD_cmd
	push {lr}
	;rs = 0
	mov r10, #0
	;BL RS
	;r/w = 0
	mov r10, #0
	BL RW
	;E = 0
	BL Disable
	; 6uS delay
	; pass in r0 as param 
	ldr r0, =0x7
	BL delay
	pop {pc}
	

	
Enable 
	push {lr}
	mov r10,#1
	str r10,[r7]
	pop {pc}
	
Disable
	push {lr}
	mov r10, #0
	str r10,[r7]
	pop {pc}

	
RS ;expect data,r0
    ;rs is r6
	push {lr}
    str r10,[r6]
    pop {pc}

RW; expect data, r0
    ;rw is r8
	push {lr}
    str r10,[r8]
    pop {pc}
	
stop b stop
	END
	