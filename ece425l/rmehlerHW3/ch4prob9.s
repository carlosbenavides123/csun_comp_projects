;What constant would be created if the following 
;operators are used with a DCD directive? 
;For example,
;MASK DCD 0x5F:ROL:3
;What is mask?
; mask is a bit pattern!


        GLOBAL Reset_Handler; required mystartup.s from experiment 3
        AREA mycode, CODE,Readonly
Reset_Handler;crucial placement

original RN 0
lol 	DCD 0x5F
MASK DCD 0x5F:ROL:3 ;MASK DCD 0x5F:ROL:3;rotate A left by B bits/ A:ROL:B
	
    ENTRY	
	LDR original, lol ; 0101 1111
	LDR r1, MASK ; 0010 1111 1000
	
	; Q1
original2 RN 2	
lmao	DCD 0x5F ; 0101 1111
MASK1 	DCD	0x5F:SHR:2 ; 0001 0111 shift right LOGICAL
	
	LDR original2,lmao
	LDR r3, MASK1

	; Q2
original3 RN 4
rofl 	DCD 	0X5F
MASK2	DCD 	0X5F:AND:0XFC
	
	LDR original3, rofl ; 0101 1111
	LDR r5, MASK2 ; AND operation
				;0x5F is 0101 1111
				;0xFC is 1111 1100
				;		 0101 1100 LOGICAL AND!!!

	;Q3
original4 RN 6
lmaokai	DCD 	0X5F
MASK3 	DCD 	0x5F:EOR:0xFF	

	LDR original4, lmaokai ; 0101 1111
	LDR R7, MASK3;0x5F is 0101 1111
				 ;0xFF is 1111 1111
				 ;        1010 0000 EXCLUSIVE OR

	; Q4

original5 	RN 8
haha 	DCD 	0X5F;95 IN DECIMAL
MASK4	DCD 	0X5F:SHL:12;389120 IN DECIMAL 

	LDR original5,haha ;0101 1111
	LDR R9, MASK4;SHIFT LEFT!!!!
			;SHIFT LEFT RESULT
			;0101 1111 0000 0000 0000
			;OR 0X5F * 2^12 
			;OR 95 * 2^12
	
stop    B stop
        END 