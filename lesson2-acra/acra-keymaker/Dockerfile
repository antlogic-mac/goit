# Use the latest Ubuntu image
FROM ubuntu:24.10

# Set noninteractive mode to avoid interaction during the build process
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install prerequisites
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    build-essential \
    cmake \
    git \
    pkg-config \
    libssl-dev \
    apt-transport-https \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Add the Cossack Labs APT repository key
RUN wget -qO - https://pkgs-ce.cossacklabs.com/gpg | apt-key add -

# Add the Cossack Labs APT repository to the sources list
RUN echo "deb https://pkgs-ce.cossacklabs.com/stable/ubuntu noble main" > /etc/apt/sources.list.d/cossacklabs.list

# Update the package list again and install Themis and Acra
RUN apt-get update && apt-get install -y \
    libthemis-dev \
    libthemis \
    acra \
    && rm -rf /var/lib/apt/lists/*

# Copy key generation script to the image
COPY /keygen.sh /keygen.sh

# Add volumes with keys
VOLUME ["/keys"]

# Set the default command to the key generation script
CMD ["/keygen.sh"]
