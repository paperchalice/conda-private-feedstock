cmake -S . -B bld `
    -DCMAKE_INSTALL_LIBDIR=lib `
    -DBUILD_SHARED_LIBS=ON `
    -DPNG_STATIC=OFF `
    -DENABLE_TEST=OFF
cmake --build bld
cmake --install bld
