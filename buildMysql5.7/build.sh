#!/bin/bash
NAME="pickapp/mariadb-alpine"
VERSION=10.2.5

docker rmi -f ${NAME}:${VERSION} 2>/dev/null
docker rmi -f ${NAME}:latest 2>/dev/null
docker build --rm -t ${NAME}:${VERSION} -t ${NAME}:latest . \
   && docker push ${NAME}:latest \
   && docker push ${NAME}:${VERSION}
