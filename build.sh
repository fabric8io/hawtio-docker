#!/usr/bin/env bash

echo "building the Docker container for http://hawtio.io/"
docker build -t fabric8/hawtio .
