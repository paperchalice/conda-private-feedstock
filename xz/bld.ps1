(Get-Content CMakeLists.txt).Replace('RUNTIME_OUTPUT_NAME "liblzma"', 'RUNTIME_OUTPUT_NAME "lzma"') | `
  Set-Content CMakeLists.txt

cmake -S . -B build `
  -DBUILD_SHARED_LIBS=ON `
  -DXZ_NLS=ON
cmake --build build --config $CMAKE_BUILD_TYPE
cmake --install build --config $CMAKE_BUILD_TYPE

$xz_tools = @('unxz', 'xzcat', 'lzma', 'unlzma', 'lzcat')
foreach ($t in $xz_tools) {
  New-Item -Path "$LIBRARY_BIN\$t.exe" -ItemType SymbolicLink -Target "xz.exe"
}
