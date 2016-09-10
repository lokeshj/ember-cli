FROM node:4.5.0
MAINTAINER Lokesh Jangid <lokesh+docker.ember-cli@opinioapp.com>

EXPOSE 4200 35729
WORKDIR /myapp

# run ember server on container start
ENTRYPOINT ["/usr/local/bin/ember"]
CMD ["server"]

# Note: npm is v2.15.9
RUN \
    npm install -g npm@2 &&\
	npm install -g ember-cli@2.8.0 &&\
	npm install -g bower@1.7.9 &&\
	npm install -g phantomjs@2.1.1 &&\
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
