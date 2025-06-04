cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DINSTALL_UTILS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
