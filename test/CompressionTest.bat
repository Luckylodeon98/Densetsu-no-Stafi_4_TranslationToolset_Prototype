Copy IntroBMG CompressionTest\IntroBMGLZSS.bin
Copy IntroBMG CompressionTest\IntroBMG_RLE.bin
lzss -ewo CompressionTest\IntroBMGLZSS.bin
rle -e CompressionTest\IntroBMG_RLE.bin CompressionTest\IntroBMG_RLE.bin
pause