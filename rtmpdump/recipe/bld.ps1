$Env:OPENSSL_ROOT_DIR = "$Env:BUILD_PREFIX\Library"

Copy-Item "$RECIPE_DIR\CMakeLists.txt" -Destination .
(Get-Content librtmp\rtmp_sys.h).Replace('#define snprintf', '//').Replace('#define vsnprintf', '//').Replace('#define EWOULDBLOCK', '//') | `
  Set-Content librtmp\rtmp_sys.h

cmake -S . -B build -DBUILD_SHARED_LIBS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
