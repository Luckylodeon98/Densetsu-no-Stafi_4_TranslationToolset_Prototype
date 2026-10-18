.nds
.relativeinclude on
.open "overlay_0014.bin", 0x021275E0

.org 0x0214F390
OVL_0014_BMG_1:
.import "BMG/GAME_INTRO.BMG"
.close

.relativeinclude off
.open "ARM9/arm9.bin", 0x02000000

.org 0x020932FC
	.word OVL_0014_BMG_1

.org 0x020933AC
	.word OVL_0014_BMG_1
.close
