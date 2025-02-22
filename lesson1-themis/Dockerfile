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
    python3 \
    python3-pip \
    python3-dev \
    apt-transport-https \
    software-properties-common \
    bsdmainutils \
    dumpasn1 \
    micro \
    && rm -rf /var/lib/apt/lists/*

# Add the Cossack Labs APT repository key
RUN wget -qO - https://pkgs-ce.cossacklabs.com/gpg | apt-key add -

# Add the Cossack Labs APT repository to the sources list
RUN echo "deb https://pkgs-ce.cossacklabs.com/stable/ubuntu noble main" > /etc/apt/sources.list.d/cossacklabs.list

# Update the package list again and install Themis
RUN apt-get update && apt-get install -y \
    libthemis-dev \
    libthemis \
    && rm -rf /var/lib/apt/lists/*

# Verify the installation
RUN echo "Themis version:" && themis --version || echo "Themis installed successfully!"

# Install venv
RUN add-apt-repository universe && apt update
RUN apt install -y python3.12-venv

# Create a virtual environment using python3-venv
RUN python3 -m venv /opt/pythemis-env

# Activate the virtual environment and ensure pip is installed
RUN /opt/pythemis-env/bin/python3 -m ensurepip --upgrade
RUN /opt/pythemis-env/bin/pip install --upgrade pip

# Activate the virtual environment and install pythemis
RUN /opt/pythemis-env/bin/pip3 install pythemis

# Add virtual environment to PATH
ENV PATH="/opt/pythemis-env/bin:$PATH"

# Verify Python wrapper installation
RUN . /opt/pythemis-env/bin/activate

# Set the working directory
WORKDIR /app

# Default command to keep the container running
CMD ["bash"]
