#!/bin/bash

docker run --rm -it --name missingdep ubuntu sh -c 'apt-get update && apt-get install -y curl && while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'