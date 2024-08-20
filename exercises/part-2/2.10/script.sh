#!/bin/bash

docker compose up --build
# docker compose down
# docker volume rm $(docker volume ls -q)

# docker container inspect postgres | grep -A 5 Mounts

# docker run -it --rm --network host networkstatic/nmap localhost