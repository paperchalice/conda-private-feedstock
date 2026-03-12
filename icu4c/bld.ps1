Enter-M2

Set-Location source

[string[]]$configure_args = @(
    , "--prefix=$($LIBRARY_PREFIX.Replace('\', '/'))"
    , '--enable-shared'
    , '--disable-static'
    , '--disable-samples'
    , '--disable-tests'
    , '--disable-renaming'
    , '--enable-release'
    , '--disable-debug'
    , '--build=x86_64-w64-mingw32'
)

# workaround for "No rule to make target 'out/tmp/dirs.timestamp'"
New-Item -ItemType Directory data\out\tmp
New-Item data\out\tmp\dirs.timestamp

$Env:PYTHON = Get-Command python
$Env:CXXFLAGS += ' -std:c++17'
bash -c "./configure $($configure_args -join ' ')"
bash -c 'make -j'
bash -c 'make install'

Move-Item -Path $LIBRARY_LIB\*.dll -Destination $LIBRARY_BIN
