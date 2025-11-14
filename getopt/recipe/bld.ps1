cmake -S . -B bld `
    -DBUILD_SHARED_LIBS=ON `
    -DBUILD_STATIC_LIBS=OFF `
    -DBUILD_TESTING=OFF
cmake --build bld --config $CMAKE_BUILD_TYPE
cmake --install bld --config $CMAKE_BUILD_TYPE
