$Env:CFLAGS = ($Env:CFLAGS -replace '/', '-') + ' -O1'
$MSYS2_PREFIX = $LIBRARY_PREFIX -replace '\\', '/' -replace 'C:', '/c/'
$Env:CC = 'compile cl'
$Env:WINDRES = 'windres-rc rc'

bash -c "./configure --prefix=$MSYS2_PREFIX --enable-shared=yes --enable-static=no --host=x86_64-pc-windows"
bash -c 'make'
bash -c 'make install'

Rename-Item $LIBRARY_LIB\charset.dll.lib $LIBRARY_LIB\charset.lib
Rename-Item $LIBRARY_LIB\iconv.dll.lib $LIBRARY_LIB\iconv.lib
