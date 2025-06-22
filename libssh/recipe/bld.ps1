$Env:OPENSSL_ROOT_DIR = "$Env:BUILD_PREFIX\Library"
(Get-Content src/gssapi.c).Replace('#include <gssapi/gssapi.h>',
  "#define WIN32_LEAN_AND_MEAN`n#include <gssapi/gssapi.h>") | `
  Set-Content src/gssapi.c
(Get-Content src/libcrypto.c).Replace('EVP_CIPHER_CTX_init', 'EVP_CIPHER_CTX_reset') | `
  Set-Content src/libcrypto.c

Remove-Item $Env:BUILD_PREFIX\Library\lib\libcrypto.lib

$cmake_options = @(
  '-DBUILD_SHARED_LIBS=ON',
  '-DWITH_EXAMPLES=OFF',
  "-DGSSAPI_ROOT_DIR=$Env:BUILD_PREFIX\Library",
  "-DOPENSSL_CRYPTO_LIBRARY=$Env:BUILD_PREFIX\Library\lib\crypto.lib",
  '-DGSSAPI_FLAVOR_MIT=ON'
  '-DGSSAPI_LIBRARIES=gssapi64.lib;krb5_64.lib;comerr64.lib'
)

cmake -S . -B build --debug-find-pkg=OpenSSL @cmake_options
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
