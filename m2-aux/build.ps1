$tools = @('windres-rc', 'cl_cpp_wrapper', 'compile', 'ar-lib')

New-Item -Path $LIBRARY_BIN -ItemType Directory -Force
foreach ($t in $tools) {
    Copy-Item "$RECIPE_DIR\$t" -Destination $LIBRARY_BIN
}
