Enter-M2
$MSYS2_PREFIX = $LIBRARY_PREFIX -replace '\\', '/' -replace 'C:', '/c/'
bash -c "./configure --prefix=$MSYS2_PREFIX --enable-shared=yes --enable-static=no --build=x86_64-w64-mingw32"
Set-Location gettext-runtime\intl
bash -c "./configure --prefix=$MSYS2_PREFIX --enable-shared=yes --enable-static=no --build=x86_64-w64-mingw32"
bash -c 'make'
bash -c 'make install'

Rename-Item $LIBRARY_LIB\intl.dll.lib $LIBRARY_LIB\intl.lib
