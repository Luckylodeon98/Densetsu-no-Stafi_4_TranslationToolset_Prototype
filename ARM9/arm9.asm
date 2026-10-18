.open "arm9.bin", 0x02000000

.org 0x0203F33C
	push	   {r1, r4}
	ldr			r1, Relocated_OG_CODE
	bx			r1
	bx			lr
.org 0x0207C8DC
Relocated_OG_CODE:
	pop		   {r1, r4}
    ldr         r3,[BMG_PTR_DAT]                               
    mov         r2, #0xB0
    mla         r2,r1,r2,r3
    ldr         r0,[r2,r0,lsl #0x2]
	blx		    thumbcodepointer ;<-- To New Code!
	bx		    lr
thumbcode:
.thumb
	push	   {r1-r3,r4}
	ldr 		r1, [ARM9_BMG_01_POINTER01]
	cmp			r0, r1
	BEQ			NewAddressItemPickup
	pop		   {r1-r3, r4}
	bx 			lr
NewAddressItemPickup:
	ldr			r0, New_ARM9_BMG_01_LOCATION
	ldr			r1, New_ARM9_BMG_01_POINTER
	ldr			r2, New_ARM9_BMG_01_FILESIZE
	SWI			0x0C
	mov			r0, r1
	pop		   {r1-r3, r4}
	bx			lr
	
thumbcodepointer
.word thumbcode +1
BMG_PTR_DAT:
	.word 0x020932FC

;OGPointers
ARM9_BMG_01_POINTER:
	.word 0x02093338
New_ARM9_BMG_01_LOCATION:
	.word 0x00872400
New_ARM9_BMG_01_POINTER:
	.word 0x02
New_ARM9_BMG_01_FILESIZE
	.word 0x00000EE0





