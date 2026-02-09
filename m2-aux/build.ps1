$urls = @{
    'ar-lib' = 'https://github.com/autotools-mirror/automake/raw/refs/heads/master/lib/ar-lib'
    'compile' = 'https://github.com/autotools-mirror/automake/raw/refs/heads/master/lib/compile'
    'cl_cpp_wrapper' = 'https://github.com/microsoft/vcpkg/raw/refs/heads/master/ports/vcpkg-make/wrappers/cl_cpp_wrapper'
    'windres-rc' = 'https://github.com/microsoft/vcpkg/raw/refs/heads/master/ports/vcpkg-make/wrappers/windres-rc'
}

New-Item -Path $LIBRARY_BIN -ItemType Directory -Force
foreach ($entry in $urls.GetEnumerator()) {
    Invoke-WebRequest $($entry.Value) -OutFile $LIBRARY_BIN\$($entry.Key)
}
