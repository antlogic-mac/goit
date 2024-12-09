#! /bin/sh
# Run Docker container with Themis and Python installed, sharing the current folder with basic python scripts.

docker run -it -v "$(pwd):/app:ro" themis-container