#node 8.2.0, npm 5.3.0
FROM node:8.2.1
MAINTAINER Lokesh Jangid <lokesh+docker.ember-cli@opinioapp.com>

EXPOSE 4200 49153
WORKDIR /myapp

RUN npm install -g ember-cli@2.14.0\
	npm install -g bower@1.8.0 &&\
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
