$opts = @(
    'VC-WIN64A',
    "--prefix=$LIBRARY_PREFIX",
    "--openssldir=SSL",
    '--release',
    'enable-brotli',
    'enable-zlib',
    'enable-zstd',
    '--with-zlib-lib=z.lib',
    '--with-zstd-lib=zstd.lib'
    'no-legacy',
    'no-tls-deprecated-ec',
    'no-deprecated',
    'no-tests',
    'no-unit-test',
    'shared'
)
$Env:CFLAGS += " -O1 -FS -DINSTALLDIR=`"\`"$($LIBRARY_PREFIX.Replace('\', '\\'))\`"`""
$Env:CXXFLAGS += ' -O1 -FS'
$Env:LDFLAGS += ' /DEBUG'
perl .\Configure @opts
jom -j 8
jom -j 8 install

Remove-Item $LIBRARY_BIN\*.pdb
New-Item $LIBRARY_LIB\pkgconfig -Force -ItemType Directory
Copy-Item exporters\*.pc -Destination $LIBRARY_LIB\pkgconfig
