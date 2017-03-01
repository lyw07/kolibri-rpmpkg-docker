#!/bin/bash

command_search() {
	command -v "$1" >/dev/null 2>&1;
}

if command_search fpm ; then
	echo -e "fpm is already installed.\n"

else
	echo -e "---Downloading fpm---\n"
	gem install --no-ri --no-rdoc fpm
fi

if command_search pip ; then
	echo -e "pip is already installed.\n"
else
	echo -e "---Getting pip---\n"
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python get-pip.py
fi

SOURCE=`find . -name 'kolibri*.tar.gz' -type f -exec basename {} ';'`

echo -e "---Getting rpm package by using fpm---\n"
RPMPACKAGE=`fpm -s tar -t rpm $SOURCE`
NAME=`grep -o 'kolibri.*rpm' <<< "$RPMPACKAGE"`


echo -e "Successfully get $NAME"

cp $NAME /rpmfile/