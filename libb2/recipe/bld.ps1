$Env:CFLAGS = ($Env:CFLAGS -replace '/', '-') + '-O1'
$MSYS2_PREFIX = $LIBRARY_PREFIX -replace '\\', '/' -replace 'C:', '/c/'

bash -c './autogen.sh'
bash -c "./configure --disable-static --prefix=$MSYS2_PREFIX"
bash -c 'make'
bash -c 'make install'

Rename-Item -Path "$LIBRARY_LIB\b2.dll.lib" -NewName "b2.lib"
$data = Get-Content "$LIBRARY_LIB\libb2.la"
$data = $data.Replace('b2.dll.lib', 'b2.lib')
$data | Out-File -encoding ASCII "$LIBRARY_LIB\libb2.la"
$data = Get-Content "$LIBRARY_LIB\pkgconfig\libb2.pc"
$data -replace '^prefix=.+', "prefix=$LIBRARY_PREFIX" | Out-File -encoding ASCII "$LIBRARY_LIB\pkgconfig\libb2.pc"
