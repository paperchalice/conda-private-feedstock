Enter-M2

[string[]]$configure_args = @(
    , "--prefix=$(cygpath $LIBRARY_PREFIX)"
    , '--enable-shared=yes'
    , '--enable-static=no'
    , '--build=x86_64-w64-mingw32'
    , '--enable-year2038'
    , '--enable-relocatable'
    ,  "--with-libiconv-prefix=$(cygpath $LIBRARY_PREFIX)"
)

bash -c "./configure $($configure_args -join ' ')"
bash -c 'make -j'
bash -c 'make install'

Get-ChildItem $LIBRARY_LIB\*.dll.lib | Rename-Item -NewName { $_.Name -replace '\.dll.lib','.lib' }
