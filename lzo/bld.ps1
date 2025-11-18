cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5' `
    -DENABLE_SHARED=ON `
    -DENABLE_STATIC=OFF
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
