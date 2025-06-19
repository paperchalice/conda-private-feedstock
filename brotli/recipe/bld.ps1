cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
