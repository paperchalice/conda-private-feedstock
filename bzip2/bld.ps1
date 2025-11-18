cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DENABLE_SYMLINK_ON_WINDOWS=ON `
    -DINSTALL_UTILS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
