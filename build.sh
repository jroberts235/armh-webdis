#!/bin/bash
VERSION='0.1.1'

docker build -t jroberts235/armh-webdis:$VERSION . &&
docker push jroberts235/armh-webdis:$VERSION
