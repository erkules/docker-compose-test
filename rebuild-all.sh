#!/bin/bash

docker rm -f  $(docker ps -a -q)

/bin/bash ./build.sh
