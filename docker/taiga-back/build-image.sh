#!/bin/bash

mkdir ansible
cp -a ../../{roles,site.yml,hosts} ansible

IMAGENAME="taiga-back"
IMAGEVERSION="0.0.1"
docker build -t ${IMAGENAME}:${IMAGEVERSION} .

rm -rf ansible
