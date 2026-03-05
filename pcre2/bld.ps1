cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DBUILD_STATIC_LIBS=OFF `
    -DPCRE2_SUPPORT_JIT=ON `
    -DPCRE2_BUILD_TESTS=OFF
cmake --build build
cmake --install build
