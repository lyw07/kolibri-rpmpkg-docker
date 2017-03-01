#!/bin/sh
docker pull centos
docker build -t rpmimage $PWD
docker run -v $PWD/out:/rpmfile --name rpm kolibri