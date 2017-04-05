# Introduction to docker-container-orchestration

https://blog.codeship.com/orchestrate-containers-for-development-with-docker-compose/


# Installation

1. launch EC2
2. install docker

e.g. on Debian Jessie:
```
wget https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.9.1-0~jessie_amd64.deb
sudo apt-get update
dpkg -i docker-engine_1.9.1-0~jessie_amd64.deb
```
if you get errors, try:
```
apt-get -f install
dpkg -i docker-engine_1.9.1-0~jessie_amd64.deb
```

3. install docker-compose following these instructions: https://docs.docker.com/compose/install/
4. sudo mkdir /data
5. sudo chown ubuntu /data
6. clone the backend repository:
7. run docker-compose and spawn all instances:
```
docker-compose up -d
docker run -d --name=nginx-proxy --restart=always -p 80:80 -p 443:443 -v /etc/nginx/vhost.d -v /usr/share/nginx/html -v /etc/nginx/ssl:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
sudo docker run -d -v /etc/nginx/ssl:/etc/nginx/certs:rw --volumes-from nginx-proxy -v /var/run/docker.sock:/var/run/docker.sock:ro jrcs/letsencrypt-nginx-proxy-companion
```
8. verify running containers:
```
docker ps
```

9. Find out IP-Address of rethink-container:
```
docker inspect $ContainerID|grep IPA
```
10. Pass this IP-Address into ./server/datasources.json

# Trouble-Shooting/Uninstallation
1. remove all containers:
```
docker rm -f  $(docker ps -a -q)
```

2. remove all images:
```
docker rmi $(docker images -q)
```

3. consider also rebuilding:
```
docker-compose up --build
```

# Database

Create backups of database as follows:

1. SSH into docker container
2.
```
dookie pull --db company --file my-backup.json
```

Import backupfile

```
dookie push --db company-restored --file my-backup.json
```

# TODO:

- make Step 9 and 10 obsolete by working with a localhost an exposed ports
- find out how to backup from host instead of local container
- implement backup szenario
