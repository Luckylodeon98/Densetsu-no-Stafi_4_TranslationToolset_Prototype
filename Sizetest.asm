.nds
.create "SizeTest.bin", 0x00000000
.arm.big
.word filesize("OVERLAY/OVL0014/overlay_0014.bin")
.close
