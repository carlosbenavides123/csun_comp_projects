        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

;Give the Keil directive to reserve a block of zeroed memory, holding 40
;words and labeled coeffs.
coeffs 	SPACE 160; 40 WORDS IN 160 BYTES

;Explain the difference between Keil’s EQU, DCD, and RN directives.
; equ is consts to symbols
; rn assigns symbols to registers
; dcd stores data in memory

;Which, if any, would be used for the following cases?
;Assigning the Abort mode’s bit pattern (0x17) to a new label called
;Mode_ABT.

Mode_ABT EQU 0X17

;b. Storing sequential byte-sized numbers in memory to be used for copy-
;ing to another location in memory.

; USE DCD

;c. Storing the contents of register r12 to memory address 0x40000004.

;IMPOSSIBLE

;d. Associating a particular microcontroller’s predefined memory-mapped
;register address with a name from the chip’s documentation, for example,
;VIC0_VA7R.

; use equ

	ENTRY	



stop    B   stop
        END