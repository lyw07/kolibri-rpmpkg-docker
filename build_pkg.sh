#!/bin/bash
SOURCE=`find /in -name 'kolibri*.tar.gz' -type f -exec basename {} ';'`
echo -e "---source file is $SOURCE---\n"

echo -e "---Getting rpm package from tar.gz file by using fpm---\n"
RPMPACKAGE=`fpm -s tar -t rpm /in/$SOURCE`
NAME=`grep -o 'kolibri.*rpm' <<< "$RPMPACKAGE"`

echo -e "---Successfully get $NAME---"

cp $NAME /out/