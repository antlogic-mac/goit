#! /bin/sh
# Run a Docker container with acra-keymaker and generate all the required keys.

docker run -it -v "$(pwd)/keys:/keys" -v "$(pwd)/../certificates/data:/certificates" acra-keymaker-image