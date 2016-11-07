FROM node:6.9.1
MAINTAINER Lokesh Jangid <lokesh+docker.ember-cli@opinioapp.com>

EXPOSE 4200 35729
WORKDIR /myapp

# run ember server on container start
ENTRYPOINT ["/usr/local/bin/ember"]
CMD ["server"]

RUN \
	npm install -g ember-cli@2.9.1 &&\
	npm install -g bower@1.8.0 &&\
	npm install -g phantomjs-prebuilt@2.1.13 &&\
	apt-get update &&\
	apt-get install -y zip 

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install
