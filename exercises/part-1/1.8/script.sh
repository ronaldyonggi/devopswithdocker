#!/bin/bash

docker build -t web-server .
docker run --rm web-server >> 1.8.txt