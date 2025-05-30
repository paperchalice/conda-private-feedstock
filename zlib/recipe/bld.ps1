cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DWITH_GTEST=OFF `
    -DZLIB_COMPAT=ON `
    -DINSTALL_UTILS=ON
cmake --build build --config $CMAKE_CONFIG_TYPE
cmake --build build --config $CMAKE_CONFIG_TYPE
