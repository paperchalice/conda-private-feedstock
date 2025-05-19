cmake -G "NMake Makefiles" -S . -B build ^
    -DCMAKE_BUILD_TYPE=MinSizeRel ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DWITH_GTEST=OFF ^
    -DBUILD_SHARED_LIBS=ON ^
cmake --build build
cmake --install build
