cmake -G "NMake Makefiles" -S . -B build ^
    -DCMAKE_BUILD_TYPE=MinSizeRel ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DWITH_GTEST=OFF ^
    -DZLIB_COMPAT=ON
    -DBUILD_SHARED_LIBS=ON
cmake --build build
cmake --install build
