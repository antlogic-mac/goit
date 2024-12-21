# Use the latest Ubuntu image
FROM ubuntu:24.10

# Set noninteractive mode to avoid interaction during the build process
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install prerequisites
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    build-essential \
    cmake \
    curl \
    git \
    gnupg \
    libssl-dev \
    pkg-config \
    software-properties-common \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Add the Cossack Labs APT repository key
RUN wget -qO - https://pkgs-ce.cossacklabs.com/gpg | apt-key add -

# Add the Cossack Labs APT repository to the sources list
RUN echo "deb https://pkgs-ce.cossacklabs.com/stable/ubuntu noble main" > /etc/apt/sources.list.d/cossacklabs.list

# Update the package list again and install Themis and Acra
RUN apt-get update && apt-get install -y \
    acra \
    libthemis \
    libthemis-dev \
    && rm -rf /var/lib/apt/lists/*

COPY /acra-server.sh /acra-server.sh

# Add volumes with keys and certificates
VOLUME ["/keys", "/certificates", "/config", "/data"]

# Allow access to the acra-server ports
EXPOSE 9090 9393

# Set the container entry point
ENTRYPOINT [ "/acra-server.sh" ]
