Enter-M2

[string[]]$configure_args = @(
    , "--prefix=$(cygpath $LIBRARY_PREFIX)"
    , '--enable-shared=yes'
    , '--enable-static=no'
    , '--enable-year2038'
    , '--build=x86_64-w64-mingw32'
    , "--with-libxml2-prefix=$(cygpath $LIBRARY_PREFIX)"
    , "--with-libiconv-prefix=$(cygpath $LIBRARY_PREFIX)"
    , "--with-libunistring-prefix=$(cygpath $LIBRARY_PREFIX)"
)

bash -c "./configure $($configure_args -join ' ')"
bash -c 'make -j'
bash -c 'make install'
