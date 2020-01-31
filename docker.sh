#!/bin/bash

# install docker 
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh


# install docker image
docker pull mysql:latest
