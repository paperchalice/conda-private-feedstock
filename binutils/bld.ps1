$tools = @('addr2line', 'ar', 'as', 'c++filt', 'dlltool', 'dllwrap', 'elfedit', 'gprof',
  'ld.bfd', 'ld', 'nm', 'objcopy', 'objdump', 'ranlib', 'readelf', 'size', 'strings', 'strip',
  'windmc', 'windres')

$tgt = 'x86_64-w64-mingw32-'

foreach ($t in $tools) {
  New-Item -Path "$LIBRARY_BIN\$t.exe" -ItemType SymbolicLink -Target "$tgt$t.exe"
}
