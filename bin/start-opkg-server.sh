#!/bin/sh

# 1. Build package list

cd /packages
echo "Building package list"
find . -name Packages.gz -exec rm {} +
find . -name Packages.stamps -exec rm {} +

/usr/bin/opkg-make-index . > Packages
gzip ./Packages

chmod -R 755 /packages


echo "Starting nginx"
nginx -g "daemon off;"