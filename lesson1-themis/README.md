# Themis Docker Container

This repository contains the necessary files and scripts to build and run a Docker container for Themis. 

## Contents

- `Dockerfile`: The Dockerfile for building the Themis container. If you are not familiar with Docker yet, please see the following link for reference: https://docs.docker.com/reference/dockerfile/
- `build.sh`: A script to build the Docker container. Consult Docker command line reference for the details.
- `run.sh`: A script to run the container interactively, mounting a local directory with sample Python scripts. Consult Docker command line reference for the details.
- `keygen.py`: A script which generates public/private keypair and writes to /tmp folder.
- `symenc.py`: A script which uses password-based encryption to encrypt sample message.
- `symdec.py`: A script which decrypts sample message using the password.

## Prerequisites

Make sure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)

## Usage

### 1. Build the Container

To build the Docker image, use the `build.sh` script:

```bash
./build.sh
```

### 2. Run the container, based on generated image

```bash
./run.sh
```

### 3. Run sample scripts, utilizing Themis functionality

```bash
python3 ./test.py
```

### 4. Edit scripts to achieve functionality you need.

Those could be edited locally via you favorite editor, like Visual Studio Code  - changes will be reflected in running container (almost) immediately.
