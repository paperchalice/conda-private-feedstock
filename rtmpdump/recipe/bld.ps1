Copy-Item $RECIPE_DIR\CMakeLists.txt .\
Copy-Item $RECIPE_DIR\rtmp.def .\

cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DWITH_GTEST=OFF `
    -DZLIB_COMPAT=ON `
    -DINSTALL_UTILS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
