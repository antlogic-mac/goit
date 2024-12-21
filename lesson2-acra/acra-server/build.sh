#!/bin/sh
# Build Docker image for acra-server, tagging it properly.
# Must be run from the acra-server directory.

docker build -t acra-server-image -f ./Dockerfile .