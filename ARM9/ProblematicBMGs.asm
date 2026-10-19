.nds
.relativeinclude off
.open "OVERLAY/OVL0019/overlay_0019.bin", 0x021275E0

.org 0x02246A04
.area 0x0F40
OVL19_BMG_01:
	.import "OVERLAY/OVL0019/BMG/OVL19_BMG01.BMG"

.endarea

.close

.open "OVERLAY/OVL0015/overlay_0015.bin", 0x021275E0
.org 0x02138708
;.area
OVL15_BMG_01:
	.import "OVERLAY/OVL0015/BMG/OVL15_BMG01.BMG"

;.endarea

.close

.relativeinclude on
.open "arm9.bin", 0x02000000
;----------------------------------------------DO NOT UNCOMMENT THE COMMENTED CODE UNLESS YOU KNOW HOW TO FIX THE CODE!!!!!
;.org 0x0202E2E0 ;Text Data Read Prep Code
;.arm
;	ldr		  r8, [DataReadPrepExpandPointer]
;	blx	      r8
;	b		 0x0202E2F0
;DataReadPrepExpandPointer:
;.word DataReadExpand + 1
;.pool
;
;.org 0x020251FC ;SHIFT_JISTableLookup Code
;.arm
;	ldr		   r3, [SHIFT_JISTablePointer]
;	blx		   r3
;.org 0x02025214
;	bl 0x020253A0
;.org 0x02025394
;	ldrsh      r1, [r0, #0x2]
;    ldrsh      r0, [r0, #0x6]
;	b	    Latercode
;	ldrsh	   r1, [r0, #0x0]
;	ldrsh      r0, [r0, #0x4]
;Latercode:
;    add        r0,r1,r0		
;    mov        r0,r0, lsl #0x10
;    mov        r0,r0, asr #0x10
;    bx         lr
;.org 0x020253B8
;SHIFT_JISTablePointer:
;	.word SHIFT_JISTable + 1		    
;.pool

;.org 0x0203FD70
;;Character Gate Code
;.arm
;	push		{lr}
;	ldr		r3, [CharacterGatePointer]
;	blx			r3
;	b			ReturnFromGate
;CharacterGatePointer:
;	.word CharacterGate + 1
;ReturnFromGate:
;	pop		     {lr}
;	cmp 	   r3, #0x1
;	beq		   0x0203FE48
;	mov        r0,#0x1
;    strh       r0,[r2,#0x0]
;    ldrb       r0,[r1,#0x0]
;    cmp        r0,#0xd
;    bgt        0x0203FDF0
;    cmp        r0,#0x0
;	nop
;	nop
;.pool


;Text Relocation Code (look at BMG Gate for the rest
.org 0x0203F2B0
ReturnToBase:

.org 0x0203F33C
	push	   {r1, r4}
	ldr			r1, [NewCodeLocation]
	blx			r1
BacktoOG:
	b 			ReturnToBase
NewCodeLocation:
.word Relocated_OG_CODE

;.org 0x0207C8DC
;DataReadExpand:
;.thumb
;;---------------------------	;Text Data Read Prep expanded 
;;Just to return r8 back to 0
;	push 	{r2}
;	mov		r2, #0x0
;	mov		r8, r2
;;----------------------------
;;OG Code
;	add		r1, r3, r1
;;New Code
;	ldr		r2, [TableByteRefPointer]
;	ldrb 	r2, [r2, #0x0]
;	cmp 	r2, #0x2
;	beq		AsciiKeyCalc
;;	b		NormalKeyCalc
;InitAsciiKeyCalc:
;	push 	{r1}
;	ldrb	r1,	[r1, #0x0]
;	mov		r2, #0xF0
;	and		r1, r2
;	cmp		r1, #0x40
;	beq		AsciiKeySignal
;	b		AltNormalKeyCalc
;AsciiKeySignal:
;	ldr		r2, [TableByteRefPointer]
;	mov		r1, #0x2
;	strb	r1, [r2, #0x0]
;	pop		{r1}
;	b		NormalKeyCalc
;AsciiKeyCalc:
;	sub		r1, r1, #0x1
;	b		NormalKeyCalc
;;OG Code
;AltNormalKeyCalc:
;	pop		{r1}
;NormalKeyCalc:
;	pop		{r2}
;	str 	r1, [r4, #0x14]
;	ldr		r3, [r0, #0x0]
;	ldr		r1,	[r4, #0x14]
;	
;	bx		lr

;-------------------------------	;CharacterTableLookupForFonts
;.align 4
;SHIFT_JISTable:		;This will be moved at a later point when expansion starts!
;.thumb
;	ldr		r3,	[TableByteRefPointer]
;	ldrb	r3, [r3, #0x0]
;	cmp		r3, #0x3
;	beq     ReturnToJapan
;	cmp		r3, #0x2
;	beq		AltCharLookup
;	cmp		r3, #0x1
;	beq		InitAltCharLookup
;	b		AltExitPoint
;AltCharLookup:
;;	sub		r6, r6, #0x1
;InitAltCharLookup:
;	ldrb	r2, [r6, #0x0]
;	cmp	    r2, #0x41		;A
;	beq	    CapitalAGlyph
;	b		AltExitPoint    
;CapitalAGlyph:
;	mov      r2, #0x82
;	mov	     r1, #0x60
;	b           ExitPoint
;ReturnToJapan:
;	push 		{r0}
;	mov			r0, #0x0
;	ldr			r3, [TableByteRefPointer]
;	strb		r0, [r3, #0x0]
;	pop			{r0}
;AltExitPoint:
;	ldrb    r2, [r6, #0x0]
;	ldrb     r1, [r0, #0x1]
;	b	BX_EXIT
;ExitPoint:
;	push 		{r0}
;	mov			r0, #0x2
;	ldr			r3, [TableByteRefPointer]
;	strb		r0, [r3, #0x0]
;	pop			{r0}
;BX_EXIT:
;	bx       lr
;;--------------------------------	;Character Comparision gate for Character Read Code.
;.align 4
;CharacterGate:		;This will be moved at a later point!
;.thumb
;	ldr	   	   r3, [TableByteRefPointer]
;	ldrb	   r3, [r3, #0x0]
;	cmp		   r3, #0x2
;	beq		   AsciiLoadByte
;    ldrb       r0,[r1, #0x0]
;	b		   OGByteCodeBranch
;AsciiLoadByte:
;;	sub		   r1, r1, #0x1
;	ldrb	   r0, [r1, #0x0]
;OGByteCodeBranch:
;    mov	       r3, #0xF0
;    and        r0, r3
;    cmp        r0, #0x80
;    beq        KeyAccepted
;    cmp        r0, #0x90
;    beq        KeyAccepted
;    cmp        r0, #0xe0
;    beq        KeyAccepted
;    cmp        r0, #0xf0
;    beq        KeyAccepted
;    cmp	       r0, #0x40
;    beq	       AsciiKeyAccepted
;     b		   GateExit
;AsciiKeyAccepted:
;	ldr	   	   r3, [TableByteRefPointer]
;	ldrb	   r3, [r3]
;	cmp		   r3, #0x2
;	beq		   Already_Ascii
;	mov		   r1, #0x1
;	ldr	   	   r3, [TableByteRefPointer]
;	strb	   r1, [r3]
;Already_Ascii:
;	b	KeyToggleJump
;KeyAccepted:
;	ldr	   	   r3, [TableByteRefPointer]		
;	mov		   r1, #0x3
;	strb	   r1, [r3]
;KeyToggleJump:
;     mov	r3, #0x1
;GateExit:
;	bx		lr
;.align 4
;TableByteRefPointer:
;.word TableByteRef
;.align 4
;TableByteRef:
;.byte 00




;--------------------------------- BMG Gate
.align 4
Relocated_OG_CODE:
.arm
	pop		   {r1, r4}
    ldr         r3,[BMG_PTR_DAT]
    mov         r2, #0xB0
    mla         r2,r1,r2,r3
    ldr         r0,[r2,r0,lsl #0x2]
	push	   {r1-r3,r4}
	ldr			r1, [Checkpoint1Pointer]
	blx			r1
	b			BacktoOG
.align 4
Checkpoint1Pointer:
.word Checkpoint1 + 1
Checkpoint1:
.thumb
	ldr			r1, [ARM9_BMG_06_POINTER]
	cmp			r0, r1
	BEQ			NewAddressKyoroPhone
	b			Checkpoint2
;----------------------------------------
.align 4
ARM9_BMG_06_POINTER:
	.word ARM9_BMG_06
;-----------------------------------------
Checkpoint2:
	ldr 		r1, [ARM9_BMG_01_POINTER]
	cmp			r0, r1
	BEQ			LocalAddressFunc
	b			Checkpoint3
;------------------------------------------
.align 4
ARM9_BMG_01_POINTER:
	.word ARM9_BMG_01
;------------------------------------------
Checkpoint3:
	ldr			r1, [ARM9_BMG_00_POINTER]
	cmp			r0, r1
	BEQ			LocalAddressFunc
	b			Checkpoint4
;-------------------------------------------
.align 4
ARM9_BMG_00_POINTER:
	.word ARM9_BMG_00
;-------------------------------------------
Checkpoint4:
	ldr			r1, [ARM9_BMG_02_POINTER]
	cmp			r0, r1
	BEQ			NewAddressPauseMenu
	b			Checkpoint5
;-------------------------------------------
.align 4
ARM9_BMG_02_POINTER:
	.word ARM9_BMG_02
;-------------------------------------------
;Another Checkpoint:							;<--------------------- That's just an example nothing here is added!
;	ldr			r1, [another_bmg_pointer]
;	cmp			r0, r1
;	BEQ			AnotherProblematicBMG
;	b			Checkpoint5
;-------------------------------------------
Checkpoint5:
	ldr			r1,	[OVL19_BMG01_POINTER]
	cmp			r0, r1
	BEQ			NewAddressAbilitesStuffandDescriptions
	pop		   {r1-r3, r4}
	bx 			lr
;-------------------------------------------

.align 4
OVL19_BMG01_POINTER:
	.word OVL19_BMG_01
;-------------------------------------------
NewAddressKyoroPhone: ;Always Renders First in Level.
	ldr			r1, [DefaultPointer]
	mov			r2, r1
	b			DecompressAndRelocate
NewAddressPauseMenu:
	ldr			r1, [DefaultPointer]
	mov			r2, r1
	b			DecompressAndRelocate
NewAddressAbilitesStuffandDescriptions:
	ldr			r1, [AbilitiesStuffandDescriptionsPointer]
	mov			r2, r1
	b			DecompressAndRelocate
LocalAddressFunc:
	ldr			r1, [LocalAddressSavePointer]
	ldr			r1, [r1]
	mov			r2, r1
	b			DecompressAndRelocate
;AnotherProblematicBMG:
;	ldr			r1, [AnotherPointer]
;	ldr			r1, [r1]
;	mov			r2, r1
;	b			DecompressAndRelocate
DecompressAndRelocate:
	SWI			0x11 ;Decompress LZSS
	ldr			r3, [LocalAddressSavePointer]
	str			r1, [r3]
	mov			r0, r2
CodeExit:
	pop		   {r1-r3, r4}
	bx			lr
.align 4
BMG_PTR_DAT:
	.word 0x020932FC
;New Pointers
.align 4
DefaultPointer:
	.word 0x020F0E10
PauseMenuPointer:
	.word 0x020F0E10
AbilitiesStuffandDescriptionsPointer:
	.word 0x020F25D0
.align 4
LocalAddressSavePointer:
	.word LocalAddressSave
;.align 4					;<------------- Example code, not functional!!!
;AnotherPointer:
;	.word 0x02[EnterNewLocationHere]
.align 4
LocalAddressSave:
.word 0x00000000
.align 4
;Imported BMG files
ARM9_BMG_00:
.import "BMG/ARM9_0/ARM9_BMG0_ANSWERCARD_RIDDLES_0207BA3C.BMG"
.align 4
ARM9_BMG_01:
.import "BMG/ARM9_1/LZSS_IMPORT_TEST.BMG"
.align 4
ARM9_BMG_02:
.import "BMG/ARM9_2/ARM9_BMG2_PAUSESCREENTEXT_0207D7BC.BMG"
.align 4
ARM9_BMG_03:
.import "BMG/ARM9_3/ARM9_BMG3_TEXTDEBUG_0207DA1C.BMG" ;Might not have to repoint, Most likely unused!
.align 4
ARM9_BMG_04:
.import "BMG/ARM9_4/ARM9_BMG4_PossibleUsedCode_0207DB3C.BMG" ;Activates in Level Events. Please do not remove!
.align 4
ARM9_BMG_05:
.import "BMG/ARM9_5/ARM9_BMG5_SAVDATAERRORTEXT_0207E23C.BMG" ;Might not have to repoint, Unused anyways!
.align 4
ARM9_BMG_06:
.import "BMG/ARM9_6/ARM9_BMG6_PHONECONVO_0207E61C.BMG" 
.align 4
ARM9_BMG_07:
.import "BMG/ARM9_7/ARM9_BMG7_MAINGAMECLEAREDTEXT_02092FFC.BMG" ;Don't repoint for now!

;InitialPointersForCompressedData
;-----ARM9
;ARM9_BMG_00
.org 0x0209337C
	.word ARM9_BMG_00
.org 0x0209342C
	.word ARM9_BMG_00
;ARM9_BMG_01
.org 0x02093338
	.word ARM9_BMG_01
.org 0x020933E8
	.word ARM9_BMG_01
;ARM9_BMG_02
.org 0x0209331C
	.word ARM9_BMG_02
.org 0x020933CC
	.word ARM9_BMG_02
;ARM9_BMG_03
.org 0x02093314
	.word ARM9_BMG_03
.org 0x020933C4
	.word ARM9_BMG_03
;ARM9_BMG_04
.org 0x0209330C
	.word ARM9_BMG_04
.org 0x020933BC
	.word ARM9_BMG_04
;ARM9_BMG_05
.org 0x020933A8
	.word ARM9_BMG_05
.org 0x02093458
	.word ARM9_BMG_05
;ARM9_BMG_06
.org 0x02093328
	.word ARM9_BMG_06
.org 0x020933D8
	.word ARM9_BMG_06
;ARM9_BMG_07
.org 0x02093304
	.word ARM9_BMG_07
.org 0x020933B4
	.word ARM9_BMG_07
;-------OVL19
;OVL19_BMG_01
.org 0x0209333C
	.word OVL19_BMG_01
.org 0x020933EC
	.word OVL19_BMG_01





.close 

