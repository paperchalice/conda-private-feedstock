Set-Location src
$Env:OPENSSL_VERSION = 3
$Env:Path += ";$Env:WindowsSdkVerBinPath\x86"
$Env:KRB_INSTALL_DIR=$LIBRARY_PREFIX
(Get-Content config\win-pre.in).Replace('CFLAGS = $(CCOPTS)', "CFLAGS = `$(CCOPTS) $Env:CFLAGS /O1") | `
  Set-Content config\win-pre.in
nmake -f Makefile.in prep-windows
nmake NODEBUG=1
nmake install NODEBUG=1
