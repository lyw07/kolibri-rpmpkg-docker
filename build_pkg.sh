#!/bin/bash

set -eo pipefail

# Take in the zip file for Kolibri
ZIPFILE=`find /in -name 'kolibri*.zip' -type f -exec basename {} ';'`


# Unzip the zip file
echo -e "---unzipping $ZIPFILE---\n"
unzip /in/$ZIPFILE
SOURCE=${ZIPFILE%.*}


# Create RPM file by using fpm and the local python source setup.py
echo -e "---Getting rpm package by using fpm---\n"
RPMPACKAGE=`fpm -s python -t rpm --no-python-fix-name $SOURCE/setup.py`


# Get the name of the RPM file
NAME=`grep -o 'kolibri.*rpm' <<< "$RPMPACKAGE"`


# Print out the name of the RPM file
echo -e "---Successfully get $NAME---"


cp $NAME /out/