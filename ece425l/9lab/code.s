	GLOBAL user_code
	AREA task1FLASH, CODE, Readonly
	IMPORT delayfunc
    IMPORT LCD_cmd

	
user_code	
PINSEL0 EQU 0xE002C000 ;1st, pin fn selection ports   
PINSEL2 EQU 0xE002C014; for lcd interface, P1.25-P1.16
IO0DIR  EQU 0xE0028008 ;2nd, direction
IO0SET EQU 0xE0028004 ;set
IO0CLR EQU 0xE002800C ;clear
SRAM_BASE EQU 0x40000000

; use r0 to r3 as volatile registers

;specific locations for this task
LCD_DATA    EQU 0x00FF0000 ; P1.16 - P1.23
LCD_RS      EQU 0x01000000 ; p1.24
LCD_E       EQU 0x02000000 ; p1.25
LCD_RW      EQU 0x00400000 ; P0.22
LCD_LIGHT   EQU 0x40000000 ; P0.30

  ENTRY

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
LCD_pins 
    MOV r1,#0x3fff0000; pin 16 to 30?
    LDR r0,=IO0DIR
    STR r1, [r0]

    BL LCD_cmd



stop b stop
	END
