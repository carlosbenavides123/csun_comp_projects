		AREA utilities, CODE, Readonly
        IMPORT delay
		EXPORT Enable
		EXPORT RS
		EXPORT RW
        EXPORT Disable

;data
LCD_DATA    EQU 0x00FF0000 ; P1.16 - P1.23
LCD_RS      EQU 0x01000000 ; p1.24
LCD_E       EQU 0x02000000 ; p1.25
LCD_RW      EQU 0x00400000 ; P0.22
LCD_LIGHT   EQU 0x40000000 ; P0.30

;use r5-r19 as EQU 

    LDR r5, =LCD_DATA
    LDR r6, =LCD_RS
    LDR r7, =LCD_E
    LDR r8, =LCD_RW
    LDR r9, =LCD_LIGHT

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

stop	B	stop	;endless loop to make program hang
		END		;assembler directives to indicate the end of code