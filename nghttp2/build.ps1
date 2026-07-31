$cmake_args = @(
  '-DENABLE_LIB_ONLY=ON',
  '-DBUILD_SHARED_LIBS=ON',
  '-DENABLE_STATIC_LIB=OFF'
)

cmake -S . -B build @cmake_args
cmake --build build
cmake --install build
