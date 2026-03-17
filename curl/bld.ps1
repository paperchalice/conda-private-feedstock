$cmake_args = @(
  '-DENABLE_ARES=ON',
  '-DCURL_USE_LIBSSH=ON',
  '-DUSE_WIN32_IDN=ON',
  '-DUSE_NGTCP2=ON',
  '-DUSE_LIBRTMP=ON',
  '-DENABLE_UNICODE=ON',
  '-DCURL_WINDOWS_SSPI=ON'
  '-DCURL_USE_OPENSSL=ON',
  '-DLIBCURL_OUTPUT_NAME=curl'
  '-DUSE_OPENSSL_QUIC=ON'
)
$Env:CMAKE_PREFIX_PATH = $LIBRARY_PREFIX
cmake -S . -B build -DBUILD_SHARED_LIBS=ON @cmake_args
cmake --build build
cmake --install build
