# Acra keys generation

This folder contains Dockerfile which install acra-keymaker and runs script to generate acra keys.

## Contents

- `Dockerfile`: dockerfile, which would generate image with acra installed.
- `build.sh`: this script would build image from Dockerfile, tagging it as `acra-keymaker-image`.
- `keygen.sh`: this script would be copied to Docker image, and set as it's default command.
- `run.sh`: this script would run the container for the `acra-keymaker-image`, mounting the `keys` directory. After it's execution new acra keys would be generated and stored in the `keys` folder.
- `keys`: this folder contains sample acra keys, which would be overwriten after running the `run.sh`. Folder contents:
  - `master.key`: master key for acra-server
  - `charlie_*` : all the keys for the client, named charlie.
  