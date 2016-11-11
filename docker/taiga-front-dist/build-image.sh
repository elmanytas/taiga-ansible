#!/bin/bash

mkdir ansible
cp -a ../../{roles,site.yml,hosts} ansible

IMAGENAME="taiga-front-dist"
IMAGEVERSION="1.0.0"
docker build -t ${IMAGENAME}:${IMAGEVERSION} .

rm -rf ansible
