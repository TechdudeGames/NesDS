@---------------------------------------------------------------------------------
.section .text,"ax"
@---------------------------------------------------------------------------------
	#include "equates.h"
@---------------------------------------------------------------------------------	
	.global mapper76init
	cmd = mapperdata
@---------------------------------------------------------------------------------
mapper76init:@		Namco something...
@---------------------------------------------------------------------------------
	.word write0,write1,void,void

	mov pc,lr
@---------------------------------------------------------------------------------
write0:		@$8000-8001
@---------------------------------------------------------------------------------
	tst addy,#1
	bne w8001

	strb_ r0,cmd
	mov pc,lr
w8001:
	ldrb_ r1,cmd
	and r1,r1,#7
	adr r2,commandlist
	ldr pc,[r2,r1,lsl#2]

commandlist:	.word void,void,chr01_,chr23_,chr45_,chr67_,map89_,mapAB_
@---------------------------------------------------------------------------------
write1:		@$A000
@---------------------------------------------------------------------------------
	tst addy,#1
	movne pc,lr
	tst r0,#1
	b mirror2V_
@---------------------------------------------------------------------------------
