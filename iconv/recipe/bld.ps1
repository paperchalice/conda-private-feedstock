Enter-M2
$Env:RC = 'windres-rc rc'
$prefix = $LIBRARY_PREFIX.Replace('\', '/')
bash -c "./configure --prefix=$prefix --enable-shared=yes --enable-relocatable --enable-static=no --enable-nls --host=x86_64-pc-windows"
bash -c 'make'
bash -c 'make install'

Rename-Item $LIBRARY_LIB\charset.dll.lib $LIBRARY_LIB\charset.lib
Rename-Item $LIBRARY_LIB\iconv.dll.lib $LIBRARY_LIB\iconv.lib
