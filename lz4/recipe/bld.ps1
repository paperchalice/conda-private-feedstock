cmake -S build/cmake -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DINSTALL_UTILS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE

foreach ($i in @('lz4cat', 'unlz4')) {
    New-Item -Path "$LIBRARY_BIN\$i.exe" -ItemType SymbolicLink 'lz4.exe' 
}
