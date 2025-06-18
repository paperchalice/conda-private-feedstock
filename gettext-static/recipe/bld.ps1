Remove-Item bin\iconv.exe
Remove-Item share\doc -Recurse
$dirs = @(
  'bin', 'libexec', 'share'
)
foreach($d in $dirs) {
  if (Test-Path $LIBRARY_PREFIX\$d) {
    Remove-Item -Recurse -Force $LIBRARY_PREFIX\$d 
  }
  Copy-Item -Path $d -Destination $LIBRARY_PREFIX -Recurse
}
