$tools = @('windres-rc', 'cl_cpp_wrapper', 'compile', 'ar-lib')

$dest = "$LIBRARY_PREFIX\usr\bin"
New-Item -Path $dest -ItemType Directory -Force
foreach ($t in $tools) {
    Copy-Item "$RECIPE_DIR\$t" -Destination $dest
}
