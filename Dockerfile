
#Linux C build environment
From ubuntu:20.10
LABEL org.srcml.distro="ubuntu" \
org.srcml.email="yp16@zips.uakron.edu"

#Install package for C build environment
RUN apt-get update && apt-get install -y \
    #compiler
    gcc \
    g++ \
    #version control
    git \
    #build
    make \
    ninja-build \
    #utility
    curl\
    && rm -rf /var/lib/apt/lists/*

#Install cmake binary directly
RUN curl -L https://cmake.org/files/v3.18/cmake-3.18.3-Linux-x86_64.tar.g$
#Install local version of CLI11
ADD CLI11.hpp /usr/include/

# Install CLI11.hpp from URL
ARG CLI11_VERSION=1.9.1
ARG CLI11_URL=https://github.com/CLIUtils/CLI11/releases/download/v${CLI11_VERSION}/CLI11.hpp
ADD $CLI11_URL /usr/include/


# Install required boost include files
ARG BOOST_URL=http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz
RUN curl -L $BOOST_URL | tar xz -C /usr/local/include
