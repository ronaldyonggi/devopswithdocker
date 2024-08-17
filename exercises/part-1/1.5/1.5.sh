#!/bin/bash

docker run -d --rm -it --name dockeruh devopsdockeruh/simple-web-service:alpine
docker pull devopsdockeruh/simple-web-service:ubuntu
docker images > 1.5.txt
docker exec -it dockeruh tail -f ./text.log
