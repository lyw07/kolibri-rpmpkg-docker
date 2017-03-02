#!/bin/bash
yum update -y && yum install -y \
	git \
	ruby-devel \
	gcc \
	make \
	rpm-build \
&& yum clean packages

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