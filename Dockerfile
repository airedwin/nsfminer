FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu18.04

MAINTAINER Edwin
WORKDIR /

# Package and dependency setup
RUN apt-get update \
    && apt-get update \
    && apt-get install -y wget

# Download
RUN wget https://github.com/no-fee-ethereum-mining/nsfminer/releases/download/v1.3.13/nsfminer_1.3.13-ubuntu_18.04-cuda_11.2-opencl.tgz

# Extract
RUN tar zxvf nsfminer_1.3.13-ubuntu_18.04-cuda_11.2-opencl.tgz -C /usr/local/bin

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/nsfminer", "-U"]
