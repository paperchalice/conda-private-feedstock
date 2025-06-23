$cflags = $Env:CFLAGS -split ' '
$ldflags = $Env:LDFLAGS -split ' '
cl @cflags /c .\getopt.c /DEXPORTS_GETOPT
link @ldflags /DLL .\getopt.obj
Move-Item .\getopt.dll -Destination $LIBRARY_BIN
Move-Item .\getopt.lib -Destination $LIBRARY_LIB
Move-Item .\getopt.h -Destination $LIBRARY_INC
