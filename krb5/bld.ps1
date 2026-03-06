Set-Location src
$Env:OPENSSL_DIR = $LIBRARY_PREFIX
$Env:OPENSSL_VERSION = 3
$Env:Path += ";$Env:WindowsSdkVerBinPath\x86"
$Env:KRB_INSTALL_DIR=$LIBRARY_PREFIX
$Env:MY_CFLAGS = $CFLAGS

nmake -f Makefile.in prep-windows
nmake NODEBUG=1
nmake install NODEBUG=1
