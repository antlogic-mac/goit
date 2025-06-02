FROM fedora:41

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV LC_LANG=C.UTF-8
ENV ARCH=x64
ENV CPU=x86_64
ENV OS=linux
# For libiconv
ENV LD_LIBRARY_PATH=/usr/local/lib

ARG CC=gcc
ARG CXX=g++

# Install prerequisites
RUN dnf -y update                                                                                 && \
    dnf -y install sudo wget git openssl-devel bison byacc cmake python perl-Digest-SHA              \
                   json-c-devel clang gcc gcc-c++ make autoconf libtool gzip bzip2 bzip2-devel       \
                   gettext-devel ncurses-devel zlib-devel asciidoctor llvm

# Download script to build and install GnuPG from sources
RUN mkdir /opt/tools
ADD https://github.com/rnpgp/rnp-ci-containers/raw/refs/heads/main/tools/tools.sh /opt/tools/tools.sh

# Install latest GnuPG (HEAD)
RUN chmod +x /opt/tools/tools.sh && \
    /opt/tools/tools.sh build_and_install_libiconv && \
    /opt/tools/tools.sh build_and_install_gpg head
