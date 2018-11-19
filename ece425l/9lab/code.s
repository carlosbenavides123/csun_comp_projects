	GLOBAL user_code
	AREA task1FLASH, CODE, Readonly
	IMPORT delay
    IMPORT LCD_cmd
;	 IMPORT LCD_init
    IMPORT LCD_pins
	
user_code	

  ENTRY
;    BL init



init 
    ;initalize the pins
    BL LCD_pins
	BL LCD_cmd

;    ;wake up LCD
;    BL LCD_init

;    ;then send data 0x38
;    mov r0, #0x38
;    BL LCD_cmd

;    ;cmd 0xC => 0x8 == Display On/Off , 0x4 == Turn on LCD
;    mov r0, #0xC
;    BL LCD_cmd

;    ; clear LCD
;    mov r0, #0x1
;    BL LCD_cmd

;    ;entry and allow to send character, cursor move right
;    mov r0, #0x6
;    BL LCD_cmd
    BX lr

stop b stop
	END