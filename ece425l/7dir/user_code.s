
        AREA mydata, DATA, READWRITE 
sum DCD 0 ; reserve 4 byte for sum 
;result SPACE 8
		
		;sample code from prelab
        ;LDR r0,=sum; r0=0x4000 0000
        ;LDR r0, sum; r0 = 0, which is data at memory location
        ;use debugging tool to verify results of RAM contentns
		
NUM 	EQU	0x40000000
		ldr r7, #0 ; our sum
		ldr r8, =NUM
		STR r8, [r7]
TASK1
	ldr r0,=NUM
	ldr r1,[r0]
	CMP r1,#0
	ADDS r7,r1,r7
	SUBS r1,r1,#1
	BNE TASK1

char		DCB		"T",0
		ldr r8, =mystring
		ldr r3, =char
sumloc 	EQU 0x40000000 ; easy place to see our sum
		ldr r5, =sumloc
TASK3
	;load each byte of mystring until reach 0
	ldrb r9, [r8]
	CMP r9,#0 ;reach end of string?
	BEQ stop
	CMP r9,r3 ;values the same?
	ADDEQ r5,r5,#1
	

TASK4
	
	



;good idea to put strings at end of program
mystring        DCB     "This is an example of strings",0
;message         DCB     "Attention please!",0
        ALIGN
        END