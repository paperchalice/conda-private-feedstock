Enter-M2
$MSYS2_PREFIX = $LIBRARY_PREFIX -replace '\\', '/' -replace 'C:', '/c/'
bash -c "./configure --prefix=$MSYS2_PREFIX --disable-nls --enable-shared=no --enable-static=yes --build=x86_64-w64-mingw32"
bash -c 'make'
bash -c 'make install'
