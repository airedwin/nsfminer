FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu18.04

MAINTAINER Edwin
WORKDIR /

# Package and dependency setup
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && add-apt-repository -y ppa:ethereum/ethereum -y \
    && apt-get update \
    && apt-get install -y git \
     cmake \
     libcryptopp-dev \
     libleveldb-dev \
     libjsoncpp-dev \
     libjsonrpccpp-dev \
     libboost-all-dev \
     libgmp-dev \
     libreadline-dev \
     libcurl4-gnutls-dev \
     ocl-icd-libopencl1 \
     opencl-headers \
     mesa-common-dev \
     libmicrohttpd-dev \
     build-essential

# Git repo set up
RUN git clone https://github.com/no-fee-ethereum-mining/nsfminer.git; \
    cd nsfminer; \
    git checkout tags/v1.3.13; \
    git submodule update --init --recursive

# Build
RUN cd nsfminer; \
    mkdir build; \
    cd build; \
    cmake .. -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON; \
    cmake --build .; \
    make install;

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/nsfminer", "-U"]
