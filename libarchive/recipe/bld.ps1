cmake -S . -B build  --debug-find `
    -DBUILD_SHARED_LIBS=ON `
    -DENABLE_TAR_SHARED=ON `
    -DENABLE_CPIO_SHARED=ON `
    -DENABLE_CAT_SHARED=ON `
    -DOPENSSL_INCLUDE_DIR=$Env:BUILD_PREFIX\Library\include `
    -DOPENSSL_CRYPTO_LIBRARY=$Env:BUILD_PREFIX\Library\lib\crypto.lib
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
