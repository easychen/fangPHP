FROM hub.c.163.com/library/node:alpine
MAINTAINER jsonfry jason@ocastastudios.com

RUN apk --no-cache add git

WORKDIR /usr/src/app
RUN git clone https://github.com/jsonfry/node-livereload.git .
RUN npm install --registry=https://registry.npm.taobao.org

ENTRYPOINT node bin/livereload.js /usr/src/livereload-watch -u true -d
