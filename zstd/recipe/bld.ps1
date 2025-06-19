cmake -S build/cmake -B bld `
    -DBUILD_SHARED_LIBS=ON `
    -DZSTD_LEGACY_SUPPORT=OFF `
    -DZSTD_BUILD_STATIC=OFF `
    -DZSTD_PROGRAMS_LINK_SHARED=ON `
    -DZSTD_ZLIB_SUPPORT=ON `
    -DZSTD_LZMA_SUPPORT=ON `
    -DZSTD_LZ4_SUPPORT=ON
cmake --build bld --config $CMAKE_BUILD_TYPE
cmake --install bld --config $CMAKE_BUILD_TYPE
