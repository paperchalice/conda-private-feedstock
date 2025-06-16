Enter-M2
$MSYS2_PREFIX = $LIBRARY_PREFIX -replace '\\', '/' -replace 'C:', '/c/'
$config_args = @("--prefix=$MSYS2_PREFIX",
  '--disable-nls',
  '--enable-shared=no',
  '--enable-static=yes',
  '--disable-csharp',
  '--disable-java',
  '--disable-nls',
  '--build=x86_64-w64-mingw32'
) -join ' '
bash -c "./configure $config_args"
bash -c 'make -i'
bash -c 'make install -i'

Remove-Item -Recurse $LIBRARY_INC $LIBRARY_LIB
$shares = @('doc', 'info', 'man')
foreach ($d in $shares) {
  Remove-Item -Recurse $LIBRARY_PREFIX\share\$d
}
