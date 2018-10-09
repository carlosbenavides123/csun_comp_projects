	GLOBAL Reset_Handler
	AREA mycode, CODE, READONLY
Reset_Handler

PINSEL0 EQU 0xE002C000 ;pin function selection for port 0
IO0DIR EQU 0xE0028008 ; write 0 or 1
						; 1 is output 0 is input
IO0PIN 	EQU 	0xE0028000
						
;write into bit 28 and 29
t29 	DCD 	(0x1:SHL:29)
t28 	DCD		(0x1:SHL:28)
t14 	DCD		(0x1:SHL:14)

		ldr r0, =PINSEL0
		
		ldr r1, t28
		str r1,[r0]
		
		ldr r1, t29
		str r1,[r0]
		
		;make swith read status of switch?
		ldr r1, =IO0DIR
		mov r2, #0
		str r2, [r1]
		
		;read signal level
		ldr r2, =IO0PIN
		ldr r3, t14
		AND r3, r2,r3
		
		
		CMP r3, #0 ; is IO0pin 0 or 1?
				   ; if true, z is set, else z is clr
		;TST r0,#xFF test if lower bits of r0 are all zeros


        ;will probably need to make use of
        ; BEQ and BNE
		
		
		

stop	B 	stop
		END