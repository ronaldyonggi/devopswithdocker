#!/bin/bash

docker run -d --rm -it --name dockeruh devopsdockeruh/simple-web-service:ubuntu
docker exec -it dockeruh tail -f ./text.log