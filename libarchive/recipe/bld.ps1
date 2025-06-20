cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DENABLE_TAR_SHARED=ON `
    -DENABLE_CPIO_SHARED=ON `
    -DENABLE_CAT_SHARED=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
