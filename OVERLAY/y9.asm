.nds
.relativeinclude on

.open "y9.bin", 0x00000000

;NO OVERLAY SHALL GO OVER THE LIMIT OF 1,241,856 bytes (or 0x12F300 in hex)

.orga 0x00000008
OVL_0000_SIZE:
	.word filesize("OVL0000/overlay_0000.bin")
.orga 0x00000028
OVL_0001_SIZE:
	.word filesize("OVL0001/overlay_0001.bin")
.orga 0x00000048
OVL_0002_SIZE:
	.word filesize("OVL0002/overlay_0002.bin")
	
.orga 0x00000068
OVL_0003_SIZE:
	.word filesize("OVL0003/overlay_0003.bin")
	
.orga 0x00000088
OVL_0004_SIZE:
	.word filesize("OVL0004/overlay_0004.bin")
	
.orga 0x000000A8
OVL_0005_SIZE:
	.word filesize("OVL0005/overlay_0005.bin")
	
.orga 0x000000C8
OVL_0006_SIZE:
	.word filesize("OVL0006/overlay_0006.bin")
	
.orga 0x000000E8
OVL_0007_SIZE:
	.word filesize("OVL0007/overlay_0007.bin")
	
.orga 0x00000108
OVL_0008_SIZE:
	.word filesize("OVL0008/overlay_0008.bin")
	
.orga 0x00000128
OVL_0009_SIZE:
	.word filesize("OVL0009/overlay_0009.bin")
	
.orga 0x00000148
OVL_0010_SIZE:
	.word filesize("OVL0010/overlay_0010.bin")
	
.orga 0x00000168
OVL_0011_SIZE: ;WARNING OVERLAY HAS BSS SIZE!!! CANNOT INCREASE OVERLAY SIZE!!!!
	.word filesize("OVL0011/overlay_0011.bin")
	
.orga 0x00000188
OVL_0012_SIZE:
	.word filesize("OVL0012/overlay_0012.bin")
	
.orga 0x000001A8
OVL_0013_SIZE:
	.word filesize("OVL0013/overlay_0013.bin")
	
;.orga 0x000001C8
;OVL_0014_SIZE:
;	.word filesize("OVL0014/overlay_0014.bin")
	
.orga 0x000001E8
OVL_0015_SIZE: ;WARNING OVERLAY HAS BSS SIZE!!! CANNOT INCREASE OVERLAY SIZE!!!!
	.word filesize("OVL0015/overlay_0015.bin")
.orga 0x00000208
OVL_0016_SIZE:
	.word filesize("OVL0016/overlay_0016.bin")
.orga 0x00000228
OVL_0017_SIZE:
	.word filesize("OVL0017/overlay_0017.bin")
.orga 0x00000248
OVL_0018_SIZE:
	.word filesize("OVL0018/overlay_0018.bin")
	
.orga 0x00000268
OVL_0019_SIZE: ;WARNING OVERLAY HAS BSS SIZE!!! CANNOT INCREASE OVERLAY SIZE!!!!
	.word filesize("OVL0019/overlay_0019.bin")
	
.orga 0x00000288
OVL_0020_SIZE:
	.word filesize("OVL0020/overlay_0020.bin")
	
.orga 0x000002A8
OVL_0021_SIZE:
	.word filesize("OVL0021/overlay_0021.bin")
	
.orga 0x000002C8
OVL_0022_SIZE:
	.word filesize("OVL0022/overlay_0022.bin")
	
.orga 0x000002E8
OVL_0023_SIZE:
	.word filesize("OVL0023/overlay_0023.bin")
	
.orga 0x00000308
OVL_0024_SIZE:
	.word filesize("OVL0024/overlay_0024.bin")
	
.orga 0x00000328
OVL_0025_SIZE:
	.word filesize("OVL0025/overlay_0025.bin")
	
.orga 0x00000348
OVL_0026_SIZE:
	.word filesize("OVL0026/overlay_0026.bin")
	
.orga 0x00000368
OVL_0027_SIZE:
	.word filesize("OVL0027/overlay_0027.bin")
	
.orga 0x00000388
OVL_0028_SIZE:
	.word filesize("OVL0028/overlay_0028.bin")
	
.orga 0x000003A8
OVL_0029_SIZE:
	.word filesize("OVL0029/overlay_0029.bin")
	
.orga 0x000003C8
OVL_0030_SIZE:
	.word filesize("OVL0030/overlay_0030.bin")
	
.orga 0x000003E8
OVL_0031_SIZE:
	.word filesize("OVL0031/overlay_0031.bin")
	
.orga 0x00000408
OVL_0032_SIZE:
	.word filesize("OVL0032/overlay_0032.bin")
	
.orga 0x00000428
OVL_0033_SIZE:
	.word filesize("OVL0033/overlay_0033.bin")
	

.close
