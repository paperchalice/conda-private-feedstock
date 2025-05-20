cmake -S . -B build  ^
    %CMAKE_ARGS%     ^
    -DBUILD_SHARED_LIBS=ON ^
    -DWITH_GTEST=OFF ^
    -DZLIB_COMPAT=ON ^
    -DINSTALL_UTILS=ON
cmake --build build --config %CMAKE_CONFIG_TYPE%
cmake --install build --config %CMAKE_CONFIG_TYPE%
