cmake -S . -B build  ^
    %CMAKE_ARGS%     ^
    -DBUILD_SHARED_LIBS=ON ^
    -DWITH_GTEST=OFF ^
    -DZLIB_COMPAT=ON ^
    -DINSTALL_UTILS=ON
cmake --build build
cmake --install build
