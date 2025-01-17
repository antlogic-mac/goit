# Acra server

This folder contains Dockerfile which install acra server.

## Contents

- `Dockerfile`: dockerfile, which would generate image with acra installed and configured. See file contents for the explanation.
- `build.sh`: this script would build image from Dockerfile, tagging it as `acra-server-image`.
- `acra-server.sh`: this script would be copied to Docker image, and set as it's default command.
- `run.sh`: this script would run the container for the `acra-server-image`, mounting all the required directories (`keys`, `certificates`, `config`, `data`) and exposing Acra's port to the localhost.
- `config`: this folder contains sample Acra configuration, including MySQL server connection config.
- `data`: this folder would contain all the data generated and used by Acra server. It includes only `.gitignore` and is provided only to have correct folder structure for experiments.