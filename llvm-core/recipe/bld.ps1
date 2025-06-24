$cmake_args = @(
    '-DBUILD_SHARED_LIBS=ON'
    '-DLLVM_USE_SYMLINKS=ON'
    '-DLLVM_ENABLE_CURL=ON'
    '-DLLVM_ENABLE_CURL=ON'
    '-DLLVM_ENABLE_EH=ON'
    '-DLLVM_ENABLE_RTTI=ON'
    '-DLLVM_ENABLE_FFI=ON'
    '-DLLVM_ENABLE_HTTPLIB=ON'
    '-DLLVM_ENABLE_ZSTD=ON'
    '-DLLVM_INSTALL_BINUTILS_SYMLINKS=ON'
    '-DLLVM_INSTALL_CCTOOLS_SYMLINKS=ON'
    '-DLLVM_INSTALL_UTILS=ON'
    '-DLLVM_OPTIMIZED_TABLEGEN=ON'
    '-DLLVM_ENABLE_SPHINX=ON'
    '-DLLVM_BUILD_DOCS=ON'
    '-DLLVM_INCLUDE_DOCS=ON'
    '-DSPHINX_OUTPUT_MAN=ON'
    '-DSPHINX_OUTPUT_HTML=ON'
)
cmake -S llvm -B build @cmake_args
cmake --build build
cmake --install build

New-Item $LIBRARY_SHARE\vim\vimfiles -ItemType Directory
foreach($d in @('ftdetect', 'ftplugin', 'indent', 'syntax')) {
    Copy-Item llvm\utils\vim\$d\*.vim -Destination $LIBRARY_SHARE\vim\vimfiles
}
