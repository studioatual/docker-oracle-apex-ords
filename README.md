# docker-oracle-apex-ords

    # This repo is a update from araczkowski/oracle-apex-ords

Oracle Express Edition 11g Release 2 on Ubuntu 18.04 LTS with APEX 19.1 with lang:(en|pt-br) and ORDS 19.2 on Tomcat

#### Pull the docker image

    docker pull studioatual/oracle-apex-ords

#### Or Get the image code from github:

    git clone https://github.com/studioatual/docker-oracle-apex-ords.git <own-image-name>
    cd <own-image-name>

#### Building your own image, with custom password:

    docker build -t <own-image-name> --build-arg PASSWORD=<custom-password> .

#### Run the container based on your own image with 8080, 1521, 22 ports opened:

    docker run -d --name <own-container-name> -p 22:22 -p 8080:8080 -p 1521:1521 <own-image-name>

##### Connect via ssh to server with following setting:

    ssh root@localhost -p 22
    password: <custom-password> / oracle

##### Connect database with following setting:

    hostname: localhost
    port: 1521
    sid: xe
    username: system
    password: <custom-password> / oracle

##### Connect to Tomcat Manager with following settings:

    http://localhost:8080/manager
    user: ADMIN
    password: <custom-password> / oracle

##### Connect to Oracle Application Express web management console via ORDS with following settings:

    http://localhost:8080/ords/apex
    workspace: INTERNAL
    user: ADMIN
    password: <custom-password> / oracle
