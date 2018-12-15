			GLOBAL user_code
			AREA task1, CODE, Readonly
user_code	;necessary for first line of code
myprogram
	B begin
			;delay
			LDR r0,=0x40000000		;address
			LDR r1,=0x0				; r1=temp
			STR r1,[r0]
			
			LDR r3,=0x40000000		;global reg for task 1
			
			LDR r2,=0x0				; int i=0
adding		
			CMP r2,#5				;check 
			ADDNE r2,r2,#1			; for int i=0, i++
			CMP r2,#5
			BEQ next			;else
			LDR r4,[r3]
			ADDS r1,r4,#1
			ADDS r0,r4,r1	;r0=r0+1
			
			STR r0,[r3]

			BNE adding
next			
			;task3
			; load each byte until 0 and read 
			LDR r9,=0x40000000
			LDR r10,=0x0
			STR r10,[r9]
			
			LDR r5,=mystring	;string
s           DCB "s"
			LDR r4,=s
			LDRB r1,[r4]
			ALIGN
				
			
Sloop
			LDRB r9,[r5],#1		;post index
			CMP r9,r1			;'s' to string
			ADDEQ r8,r8,#1		;string inc.
			STR r8,[r9]
			
			CMP r9,#0			;reach to end
			BEQ stop
			BNE Sloop

		
			
			;task4
begin
inst1		EQU	0xFF00AA00	; # of bits:10
inst2		EQU 0x00112233	; # of bits:8
inst3		EQU 0xFFFFEEEE	; # of bits:28
	

			LDR r0,=0x40000000			;counter
			LDR r1,=0x0
			STR r1,[r0]
			
start
			LDR r4,=0x0				; int i=0
			LDR r3,=start
loop
			LSL r3,#1
			ADC r4,r4,#1			; add carry
			CMP r4,#32				;check
			
			
			ADDS r5,r5,#1		;inti=0
			BNE loop				;

			
			
			
			
			;for task 3
mystring	DCB	"If you are going to pass, you gotta love this class",0
			ALIGN
			
stop		B	stop	;endless loop to make program hang
			END		;assembler directives to indicate the end of code
