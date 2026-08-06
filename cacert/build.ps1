New-Item -ItemType Directory $LIBRARY_PREFIX\SSL -Force
Copy-Item cacert.pem -Destination $LIBRARY_PREFIX\SSL
