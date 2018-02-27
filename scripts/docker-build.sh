#!/bin/bash

if [ "$1" != "-v" -o "$1" != "--version" ]; then 
	echo "Execute script as $0 -v version or $0 --version version of docker image"
	exit 1
fi
VERSION=$2

cd ../standalone/app
docker build -t linuxautomations/app:$VERSION .
docker push  linuxautomations/app:$VERSION

cd ../nginx
docker build -t linuxautomations/nginx:$VERSION .
docker push linuxautomations/app:$VERSION
