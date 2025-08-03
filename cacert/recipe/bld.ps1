New-Item -ItemType Directory $LIBRARY_PREFIX\SSL
Copy-Item cacert.pem -Destination $LIBRARY_PREFIX\SSL
