$cmake_args = @(
  '-DENABLE_LIB_ONLY=ON',
  '-DENABLE_STATIC_LIB=OFF'
)

cmake -S . -B build -DBUILD_SHARED_LIBS=ON @cmake_args
cmake --build build
cmake --install build
