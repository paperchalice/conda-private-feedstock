Remove-Item bin\iconv.exe
Remove-Item share\doc -Recurse
$dirs = @(
  'bin', 'libexec', 'share'
)
foreach($d in $dirs) {
  Copy-Item -Path $d -Destination $LIBRARY_PREFIX -Recurse
}
