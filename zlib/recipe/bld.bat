cmake -S . -B build  ^
    %CMAKE_ARGS%     ^
    -DWITH_GTEST=OFF ^
    -DZLIB_COMPAT=ON ^
    -DBUILD_SHARED_LIBS=ON
cmake --build build
cmake --install build
