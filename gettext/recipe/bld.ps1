Enter-M2

$BashSrc = (Get-Command bash).Source
if ($BashSrc -ne "$BUILD_PREFIX\Library\usr\bin\bash.exe")
{
    false
}

[string[]]$configure_args = @(
    , "--prefix=`$(cygpath $LIBRARY_PREFIX)"
    , '--enable-shared=yes'
    , '--enable-static=no'
    , '--build=x86_64-w64-mingw32'
)

bash -c "./configure $($configure_args -join ' ')"
bash -c 'make'
bash -c 'make install'
