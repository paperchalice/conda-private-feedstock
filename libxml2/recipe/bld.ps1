(Get-Content CMakeLists.txt).Replace('PREFIX lib', 'PREFIX ""') | `
  Set-Content CMakeLists.txt

cmake -S . -B build `
  -DBUILD_SHARED_LIBS=ON `
  -DLIBXML2_WITH_LZMA=ON `
  -DLIBXML2_WITH_ZLIB=ON `
  -DLIBXML2_WITH_SCHEMATRON=ON `
  -DLIBXML2_WITH_PYTHON=OFF
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE
