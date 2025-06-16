Enter-M2
$prefix = $LIBRARY_PREFIX.Replace('\', '/')
$Env:RC = 'windres-rc rc'
$config_args = @("--prefix=$prefix",
  '--disable-nls',
  '--enable-shared=no',
  '--enable-static=yes',
  '--disable-csharp',
  '--disable-java',
  '--enable-relocatable',
  '--build=x86_64-w64-mingw32'
) -join ' '
bash -c "./configure $config_args"
bash -c 'make'
bash -c 'make install'

Remove-Item -Recurse $LIBRARY_INC $LIBRARY_LIB
$shares = @('doc', 'info', 'man')
foreach ($d in $shares) {
  Remove-Item -Recurse $LIBRARY_PREFIX\share\$d
}
