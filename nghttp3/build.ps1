$cmake_args = @(
  '-DENABLE_LIB_ONLY=ON',
  '-DENABLE_STATIC_LIB=OFF',
  '-DBUILD_SHARED_LIBS=ON'
)

cmake -S . -B build @cmake_args
cmake --build build
cmake --install build
