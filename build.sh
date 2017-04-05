#!/bin/bash

sudo echo .
docker-compose up -d
docker run -d --name=nginx-proxy --restart=always -p 80:80 -p 443:443 -v /etc/nginx/vhost.d -v /usr/share/nginx/html -v /etc/nginx/ssl:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
sudo docker run -d -v /etc/nginx/ssl:/etc/nginx/certs:rw --volumes-from nginx-proxy -v /var/run/docker.sock:/var/run/docker.sock:ro jrcs/letsencrypt-nginx-proxy-companion
