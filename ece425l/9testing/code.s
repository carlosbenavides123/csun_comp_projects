	GLOBAL user_code
	AREA main, CODE, Readonly
	IMPORT init_light
	IMPORT Enable
	IMPORT Disable
	IMPORT RS
	IMPORT RW
	IMPORT LCD_cmd
	import init_registers

SRAM_BASE EQU 0x40000000

user_code	
	;init stack
    ;initalize the pins
    BL init_light
	BL init_registers
	BL LCD_cmd
	
	mov r0,#0


stop b stop
	END
