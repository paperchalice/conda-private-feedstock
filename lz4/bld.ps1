cmake -S build/cmake -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DINSTALL_UTILS=ON
cmake --build build
cmake --install build

foreach ($i in @('lz4cat', 'unlz4')) {
    New-Item -Path "$LIBRARY_BIN\$i.exe" -ItemType SymbolicLink -Target 'lz4.exe' 
}
