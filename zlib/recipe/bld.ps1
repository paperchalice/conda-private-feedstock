Write-Output $CMAKE_BUILD_TYPE
Get-ChildItem Env:

cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DWITH_GTEST=OFF `
    -DZLIB_COMPAT=ON `
    -DINSTALL_UTILS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --build build --config $CMAKE_BUILD_TYPE
