.nds
.relativeinclude on
.createfile "GAME_INTRO.BMG",0x00000000

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
	
;INF1 Chunk (Message Info) This tells up important information about the messaages in DAT1. More specifically the location and parameters of the messages. (In this case the locations)
.aligna 16 
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
BMGFILEID: ;DO NOT TOUCH UNLESS NEED TO!!!!
	.word 0x00000000
;Pointers for Messages (Messages start 4 bytes after DAT1) 
.arm.big
DAT1MESGPOINTERS:
	.word MESG00-orga(STRINGSTART)
	.word MESG01-orga(STRINGSTART)
	.word MESG02-orga(STRINGSTART)
	.word MESG03-orga(STRINGSTART)
	.word MESG04-orga(STRINGSTART)
	.word MESG05-orga(STRINGSTART)
	.word MESG06-orga(STRINGSTART)
	.word MESG07-orga(STRINGSTART)
	.word MESG08-orga(STRINGSTART)
	.word MESG09-orga(STRINGSTART)
	.word MESG10-orga(STRINGSTART)
	.word MESG11-orga(STRINGSTART)
	.word MESG12-orga(STRINGSTART)
	.word MESG13-orga(STRINGSTART)
	.word MESG14-orga(STRINGSTART)
	.word MESG15-orga(STRINGSTART)
	.word MESG16-orga(STRINGSTART)

;DAT1 Chunk (Message Strings)
.aligna 16
IDDAT1:
	.ascii "DAT1"
DAT1CHUNKSIZE:
	.word filesize("0.bin")+filesize("1.bin")+filesize("2.bin")+filesize("3.bin")+filesize("4.bin")+filesize("5.bin")+filesize("6.bin")+filesize("7.bin")+filesize("8.bin")+filesize("9.bin")+filesize("10.bin")+filesize("11.bin")+filesize("12.bin")+filesize("13.bin")+filesize("14.bin")+filesize("15.bin")+filesize("16.bin")+9
.arm.little
STRINGSTART:
	.byte 0x00

;Text Sections get inserted here. Below is an example!
MESG00:
.incbin "0.bin"
MESG01:
.incbin "1.bin"
MESG02:
.incbin "2.bin"
MESG03:
.incbin "3.bin"
MESG04:
.incbin "4.bin"
MESG05:
.incbin "5.bin"
MESG06:
.incbin "6.bin"
MESG07:
.incbin "7.bin"
MESG08:
.incbin "8.bin"
MESG09:
.incbin "9.bin"
MESG10:
.incbin "10.bin"
MESG11:
.incbin "11.bin"
MESG12:
.incbin "12.bin"
MESG13:
.incbin "13.bin"
MESG14:
.incbin "14.bin"
MESG15:
.incbin "15.bin"
MESG16:
.incbin "16.bin"

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

