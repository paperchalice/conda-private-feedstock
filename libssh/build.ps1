$cmake_options = @(
  '-DBUILD_SHARED_LIBS=ON',
  '-DWITH_EXAMPLES=OFF',
  "-DGSSAPI_ROOT_DIR=$PREFIX\Library",
  '-DGSSAPI_FLAVOR_MIT=ON'
  '-DGSSAPI_LIBRARIES=gssapi64.lib;krb5_64.lib;comerr64.lib'
)

cmake -S . -B build @cmake_options
cmake --build build
cmake --install build
