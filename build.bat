call cleanup.bat
::BMG Maker
call preparetext.bat
armipsnew BMGMaker.asm
pause
armipsnew OVL.asm
pause
copy OVERLAY\OVL0000\overlay_0000.bin unpacked\overlay\overlay_0000.bin
copy OVERLAY\OVL0001\overlay_0001.bin unpacked\overlay\overlay_0001.bin
copy OVERLAY\OVL0002\overlay_0002.bin unpacked\overlay\overlay_0002.bin
copy OVERLAY\OVL0003\overlay_0003.bin unpacked\overlay\overlay_0003.bin
copy OVERLAY\OVL0004\overlay_0004.bin unpacked\overlay\overlay_0004.bin
copy OVERLAY\OVL0005\overlay_0005.bin unpacked\overlay\overlay_0005.bin
copy OVERLAY\OVL0006\overlay_0006.bin unpacked\overlay\overlay_0006.bin
copy OVERLAY\OVL0007\overlay_0007.bin unpacked\overlay\overlay_0007.bin
copy OVERLAY\OVL0008\overlay_0008.bin unpacked\overlay\overlay_0008.bin
copy OVERLAY\OVL0009\overlay_0009.bin unpacked\overlay\overlay_0009.bin
copy OVERLAY\OVL0010\overlay_0010.bin unpacked\overlay\overlay_0010.bin
copy OVERLAY\OVL0011\overlay_0011.bin unpacked\overlay\overlay_0011.bin
copy OVERLAY\OVL0012\overlay_0012.bin unpacked\overlay\overlay_0012.bin
copy OVERLAY\OVL0013\overlay_0013.bin unpacked\overlay\overlay_0013.bin
copy OVERLAY\OVL0014\overlay_0014.bin unpacked\overlay\overlay_0014.bin
::copy OVERLAY\OVL0014\BMG\OG\bmg1_items.bin unpacked\data\BMG\bmg1_items.bin
copy OVERLAY\OVL0015\overlay_0015.bin unpacked\overlay\overlay_0015.bin
copy OVERLAY\OVL0016\overlay_0016.bin unpacked\overlay\overlay_0016.bin
copy OVERLAY\OVL0017\overlay_0017.bin unpacked\overlay\overlay_0017.bin
copy OVERLAY\OVL0018\overlay_0018.bin unpacked\overlay\overlay_0018.bin
copy OVERLAY\OVL0019\overlay_0019.bin unpacked\overlay\overlay_0019.bin
copy OVERLAY\OVL0020\overlay_0020.bin unpacked\overlay\overlay_0020.bin
copy OVERLAY\OVL0021\overlay_0021.bin unpacked\overlay\overlay_0021.bin
copy OVERLAY\OVL0022\overlay_0022.bin unpacked\overlay\overlay_0022.bin
copy OVERLAY\OVL0023\overlay_0023.bin unpacked\overlay\overlay_0023.bin
copy OVERLAY\OVL0024\overlay_0024.bin unpacked\overlay\overlay_0024.bin
copy OVERLAY\OVL0025\overlay_0025.bin unpacked\overlay\overlay_0025.bin
copy OVERLAY\OVL0026\overlay_0026.bin unpacked\overlay\overlay_0026.bin
copy OVERLAY\OVL0027\overlay_0027.bin unpacked\overlay\overlay_0027.bin
copy OVERLAY\OVL0028\overlay_0028.bin unpacked\overlay\overlay_0028.bin
copy OVERLAY\OVL0029\overlay_0029.bin unpacked\overlay\overlay_0029.bin
copy OVERLAY\OVL0030\overlay_0030.bin unpacked\overlay\overlay_0030.bin
copy OVERLAY\OVL0031\overlay_0031.bin unpacked\overlay\overlay_0031.bin
copy OVERLAY\OVL0032\overlay_0032.bin unpacked\overlay\overlay_0032.bin
copy OVERLAY\OVL0033\overlay_0033.bin unpacked\overlay\overlay_0033.bin
copy ARM9\arm9.bin unpacked\arm9.bin
copy OVERLAY\y9.bin unpacked\y9.bin
::From this point forward add any additional file you want to modify by adding it in this format "copy (One of the main folders in the setup (ARM9, OVERLAY, or FILESYSTEM))\foldername\file unpacked\foldername\file"
:: (example) copy FILESYSTEM\Cell\clear_high_obj_l.NANR unpacked\Cell\clear_high_obj_l.NANR

ndstool -c ROM\OUTPUT.nds -9 unpacked\arm9.bin -7 unpacked\arm7.bin -y9 unpacked\y9.bin -y7 unpacked\y7.bin -d unpacked\data -y unpacked\overlay -t unpacked\banner.bin -h unpacked\header.bin
pause