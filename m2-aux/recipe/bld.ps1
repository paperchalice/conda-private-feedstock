$tools = @('windres-rc', 'cl_cpp_wrapper', 'compile', 'ar-lib')

foreach ($t in $tools) {
    Copy-Item "$RECIPE_DIR\$t" -Destination "$LIBRARY_PREFIX\usr\bin"
}
