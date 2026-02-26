$vswhere = vswhere -format json -latest -utf8 | ConvertFrom-Json
& "$($vswhere.installationPath)\Common7\Tools\Launch-VsDevShell.ps1" -SkipAutomaticLocation -Arch amd64 -HostArch amd64

cmake -S . -B build `
    -DBUILD_SHARED_LIBS=ON `
    -DWITH_GTEST=OFF `
    -DZLIB_COMPAT=ON `
    -DINSTALL_UTILS=ON
cmake --build build
cmake --install build
