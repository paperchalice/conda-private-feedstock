# remove BUILD_SHARED_LIBS=ON in next release
cmake -S . -B bld `
    -DCMAKE_INSTALL_LIBDIR=lib `
    -DBUILD_SHARED_LIBS=ON `
    -DENABLE_TEST=OFF `
    -DENABLE_LZO=ON `
    -DENABLE_TAR_SHARED=ON `
    -DENABLE_CPIO_SHARED=ON `
    -DENABLE_CAT_SHARED=ON
cmake --build bld
cmake --install bld

Remove-Item $LIBRARY_LIB\archive_static.lib
foreach ($i in @('cat', 'cpio', 'tar')) {
    New-Item -Path "$LIBRARY_BIN\$i.exe" -ItemType SymbolicLink -Target "bsd$i.exe"
}
