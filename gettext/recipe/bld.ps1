Enter-M2

[string[]]$configure_args = @(
    , "--prefix=$(cygpath $LIBRARY_PREFIX)"
    , '--enable-shared=yes'
    , '--enable-static=no'
    , '--enable-year2038'
    , '--enable-relocatable'
    , '--build=x86_64-w64-mingw32'
    , "--with-libxml2-prefix=$(cygpath $LIBRARY_PREFIX)"
    , "--with-libiconv-prefix=$(cygpath $LIBRARY_PREFIX)"
    , "--with-libunistring-prefix=$(cygpath $LIBRARY_PREFIX)"
    , '--disable-csharp'
    , '--disable-java'
)

bash -c "./configure $($configure_args -join ' ')"
bash -c 'make -j'
bash -c 'make install'

Get-ChildItem $LIBRARY_LIB\*.dll.lib | Rename-Item -NewName { $_.Name -replace '\.dll.lib','.lib' }
Remove-Item $LIBRARY_PREFIX\share\gettext\archive.dir.tar.xz
