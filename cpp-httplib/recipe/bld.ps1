$cmake_args = @(
    '-DBUILD_SHARED_LIBS=ON',
    '-DHTTPLIB_IS_USING_ZLIB=ON',
    '-DHTTPLIB_IS_USING_BROTLI=ON',
    '-DHTTPLIB_IS_USING_ZSTD=ON',
    '-DHTTPLIB_COMPILE=ON'
)

cmake -S . -B build @cmake_args
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
