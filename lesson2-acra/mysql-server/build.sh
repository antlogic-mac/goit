#! /bin/sh
# Build Docker image for MySQL server, tagging it properly.
# Must be run from the mysql-server directory.
# Please note that build context is upper-level directory, to be able to copy certificates.

docker build -t mysql-server-acra-image -f ./Dockerfile ..