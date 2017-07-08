FROM node:8.1.3
MAINTAINER Lokesh Jangid <lokesh+docker.ember-cli@opinioapp.com>

EXPOSE 4200 49153
WORKDIR /myapp

RUN \
	npm install -g ember-cli@2.14.0 &&\
	npm install -g bower@1.8.0 &&\
	npm install -g phantomjs-prebuilt@2.1.14 &&\
	apt-get update &&\
	apt-get install -y --no-install-recommends zip 

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install
