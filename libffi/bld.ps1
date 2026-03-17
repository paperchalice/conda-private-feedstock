Enter-M2

$Env:CFLAGS += ' -DFFI_BUILDING_DLL'

[string[]]$configure_args = @(
  , "--prefix=$($LIBRARY_PREFIX.Replace('\', '/'))"
  , '--enable-shared'
  , '--enable-portable-binary'
  , '--disable-multi-os-directory'
  , '--disable-static'
  , '--build=x86_64-w64-mingw32',
  , 'CCAS=msvcc.sh'
  , 'CCASFLAGS=-m64'
)
$Env:Path += ";$PWD"
bash -c "./configure $($configure_args -join ' ')"
bash -c 'make -j'
bash -c 'make install'
