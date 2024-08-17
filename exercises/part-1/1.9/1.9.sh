#!/bin/bash

docker run --rm -v "$(pwd)/text.log:/usr/src/app/text.log" --name simple-web-service devopsdockeruh/simple-web-service