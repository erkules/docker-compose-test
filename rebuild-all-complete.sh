#!/bin/bash

docker rm -f  $(docker ps -a -q)
docker rmi $(docker images -q)

/bin/bash ./build.sh
