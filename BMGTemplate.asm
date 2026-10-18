.nds
.relativeinclude on
.createfile "Template.BMG",0x00000000

;MESG Header
IDMESGbmg1:
.ascii "MESGbmg1"
FileSize:
	.word 0x00000000
NumberOfChunks:
	.fill 0x03
	.byte 0x02 ;Chucks are portions of data BMGs use, This current asm file uses INF1 and DAT1 chunks so the it's set to "02". However, there are times there would be MID1 chunks in a BMG file as well. For those cases we would set this to "03".
Encoding:
	.byte 0x03 ;DO NOT TOUCH!!! This is set to SHIFT-JIS. However, if the game you are modding support another format, switch "03" (SHIFT-JIS) to "02" for UTF-16, "01" for CP1252 (Older Japanese format), and "04" for UTF-8.
.align 16 
;INF1 Chunk (Message Info) This tells up important information about the messaages in DAT1. More specifically the location and 
IDINF1:
	.ascii "INF1"
	.arm.big
INF1CHUNKSIZE:
	.word 0x00000000
NumberOfMesgs:
	.halfword 0x0011 ;Done as example please write your wanted number of messages (or Sections if you prefer)
INFDatasize:
	.halfword 0x0004 ;Tells us how many bytes each Infdata entry has
.arm.little
BMGFILEID: ;DO NOT TOUCH
	.word 0x00000000
;Pointers for Messages (Messages start 4 bytes after DAT1) 
.arm.big
DAT1MESGPOINTERS:
	.word MESG1-orga(STRINGSTART)
	.word MESG2-orga(STRINGSTART)

;DAT1 Chunk (Message Strings)
.aligna 16
IDDAT1:
	.ascii "DAT1"
DAT1CHUNKSIZE:
	.word filesize("sect1.bin")+9
.arm.little
STRINGSTART:
	.byte 0x00

;Text Sections get inserted here. Below is an example!
MESG1:
.incbin "sect1.bin"
MESG2:
.incbin "sect1.bin"
BMGEND:
;This is the end of the BMG File. Used for Calculating the size.

BMGFILESIZECALC:
.orga 0x00000008
.arm.big
.word orga(BMGEND)-orga(IDMESGbmg1)
.arm.little

INF1CHUNKSIZECALC:
.orga 0x00000024
.arm.big
.word orga(IDDAT1)-orga(IDINF1)


.close

