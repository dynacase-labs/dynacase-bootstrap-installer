#!/usr/bin/env bash

rm -rf ./bower_components/
bower install "bootstrap"
PACKAGE_VERSION=$(bower info bootstrap version | tail -n 1 | cut -d "'" -f 2)
cd ./bower_components
mv ./bootstrap/dist/css ./bootstrap/
cp ./bootstrap/dist/js/bootstrap.js ./bootstrap/js/
cp ./bootstrap/dist/js/bootstrap.min.js ./bootstrap/js/
cp ../htaccess ./bootstrap/.htaccess
mkdir -p ./3/
mv ./bootstrap/ ./3/
mkdir ./bootstrap/
mv ./3/bootstrap/ ./bootstrap/3/
rm "../bootstrap-$PACKAGE_VERSION.zip"
zip -r "../bootstrap-$PACKAGE_VERSION.zip" bootstrap/3/css bootstrap/3/less bootstrap/3/fonts bootstrap/3/js bootstrap/3/README.md bootstrap/3/.htaccess
cd ..
scp "bootstrap-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
echo $PACKAGE_VERSION > VERSION