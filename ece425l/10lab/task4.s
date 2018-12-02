	GLOBAL user_code
	AREA task1FLASH, CODE, Readonly
PINSEL1		EQU		0xE002C004		
EXTMODE 	EQU		0xE01FC148		
EXTPOLAR 	EQU		0xE01FC14C
EXTINT		EQU		0xE01FC140
VICIntSelect 	EQU	 	0xFFFFF00C	
VICIntEnable 	EQU		0xFFFFF010

user_code 
	LDR		r0, =PINSEL1
	LDR		r1, =0x301
	STR		r1, [r0];set up pin 16
		
	LDR		r0, =EXTMODE
	LDR		r1, =0x0
	STR		r1, [r0];level sensitive
		
	LDR		r0, =EXTPOLAR
	LDR		r1, =0x0
	STR		r1, [r0];active low
	
	LDR		r0, =VICIntSelect
	LDR		r1, [r0]
	BIC 	r1, r1, #0x4000
	
	STR		r1,[r0]
	ORR 	r1, r1, #0x20000
	STR		r1,[r0]
	
	LDR		r0, =VICIntEnable
	LDR		r1, [r0]
	ORR 	r1, r1, #0x24000
	STR		r1,[r0]

 
delay
	ldr r10,=0x2
loop	subs r10,r10,#1
	b delay
stop b stop
 END
