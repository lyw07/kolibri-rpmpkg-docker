FROM centos:latest
MAINTAINER lywang07@gmail.com

RUN yum update -y && yum install -y \
	git \
	ruby-devel \
	gcc \
	make \
	rpm-build \
&& yum clean packages

ADD in /
ADD build_pkg.sh /build_pkg.sh
CMD ["/build_pkg.sh"]