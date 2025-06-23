$Env:OPENSSL_ROOT_DIR = "$Env:BUILD_PREFIX\Library"
(Get-Content lib/CMakeLists.txt).Replace('"_imp"','""') | `
  Set-Content lib/CMakeLists.txt
$cmake_args = @(
  '-DENABLE_ARES=ON',
  '-DCURL_USE_LIBSSH=ON',
  '-DUSE_WIN32_IDN=ON',
  '-DCURL_USE_OPENSSL=ON',
  '-DLIBCURL_OUTPUT_NAME=curl'
  '-DUSE_OPENSSL_QUIC=ON'
)

cmake -S . -B build -DBUILD_SHARED_LIBS=ON @cmake_args
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
