#!/bin/sh
# Build Docker image for acra-keymaker, tagging it properly.
# Must be run from the acra-keymaker directory.

docker build -t acra-keymaker-image -f ./Dockerfile .