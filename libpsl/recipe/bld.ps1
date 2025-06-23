meson setup --prefix=$LIBRARY_PREFIX `
  --buildtype=minsize `
  build
meson compile -C build
meson install -C build
