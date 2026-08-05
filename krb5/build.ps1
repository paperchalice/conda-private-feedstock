Set-Location src
$Env:OPENSSL_DIR = $LIBRARY_PREFIX
$Env:OPENSSL_VERSION = 4
$Env:Path += ";$Env:WindowsSdkVerBinPath\x86"
$Env:KRB_INSTALL_DIR=$LIBRARY_PREFIX
$Env:MY_CFLAGS = $CFLAGS

nmake -f Makefile.in prep-windows
nmake NODEBUG=1
nmake install NODEBUG=1

# Generate mo files
Set-Location po
$langs = Get-ChildItem *.po | Select-Object -ExpandProperty BaseName
foreach($lang in $langs) {
  msgfmt "${lang}.po" -o "${lang}.mo"
  $dst = "$LIBRARY_PREFIX\share\locale\$lang\LC_MESSAGES"
  New-Item -Path "$LIBRARY_PREFIX\share\locale\$lang\LC_MESSAGES" -ItemType Directory -Force
  Move-Item "${lang}.mo" "$dst\mit-krb5.mo"
}
