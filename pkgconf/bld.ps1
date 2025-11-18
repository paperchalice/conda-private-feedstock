meson setup --prefix=$LIBRARY_PREFIX `
  --buildtype=minsize `
  build
meson compile -C build
meson install -C build

New-Item -Path "$LIBRARY_BIN\pkg-config.exe" -ItemType SymbolicLink -Target "pkgconf.exe"
