$Env:CFLAGS = $null

meson setup --vsenv --prefix=$LIBRARY_PREFIX `
  --buildtype=minsize `
  build
meson compile -C build
meson install -C build
