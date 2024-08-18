#!/bin/bash

docker build -t java-app .
docker run --rm -it --name java-app -p 8080:8080 java-app