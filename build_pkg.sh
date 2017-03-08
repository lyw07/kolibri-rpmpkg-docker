#!/bin/bash

set -eo pipefail

ZIPFILE=`find /in -name 'kolibri*.zip' -type f -exec basename {} ';'`
echo -e "---unzip file $ZIPFILE---\n"
unzip /in/$ZIPFILE
SOURCE=${ZIPFILE%.*}
echo -e "---Getting rpm package by using fpm---\n"
RPMPACKAGE=`fpm -s python -t rpm --no-python-fix-name $SOURCE/setup.py`
NAME=`grep -o 'kolibri.*rpm' <<< "$RPMPACKAGE"`

echo -e "---Successfully get $NAME---"

cp $NAME /out/