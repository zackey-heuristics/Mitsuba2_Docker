FROM ubuntu:20.04

LABEL maintainer="zigzagzackey <yamazaki.keita.xa@alumni.tsukuba.ac.jp>"

ENV DEBIAN_FRONTEND=noninteractive

### Configure bash
SHELL ["/bin/bash", "-c"]

### Update and upgrade apt-get
RUN apt-get update -y
RUN apt-get upgrade -y

### Install git package
RUN apt install -y git-core

### Install tzdata package
RUN echo "6" | apt-get install tzdata

### Install recent versions build tools, including Clang and libc++ (Clang's C++ library)
RUN apt install -y \
    clang-9 \
    libc++-9-dev \
    libc++abi-9-dev \
    cmake \
    ninja-build

### Install libraries for image I/O and the graphical user interface
RUN apt install -y \
    libz-dev \
    libpng-dev \
    libjpeg-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev

### Install required Python packages
RUN apt install -y \
    python3-dev \
    python3-distutils \
    python3-setuptools

### Install packeges for running tests
RUN apt install -y \
    python3-pytest \
    python3-pytest-xdist \
    python3-numpy

### Install package for generating the documentation
RUN apt install -y \
    python3-sphinx \
    python3-guzzle-sphinx-theme \
    python3-sphinxcontrib.bibtex

### Reduce image size
RUN apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove

### Set environment variables
ENV CC clang-9
ENV CXX clang++-9

### Install Mitsuba 2
WORKDIR /root/Mitsuba2_Install
RUN git clone https://github.com/mitsuba-renderer/mitsuba2.git
WORKDIR /root/Mitsuba2_Install/mitsuba2
RUN git submodule update --init --recursive
WORKDIR /root/Mitsuba2_Install/mitsuba2/build
RUN cmake -GNinja ..
RUN ninja

### Configure environment variables for Mitsuba 2
WORKDIR /root/Mitsuba2_Install/mitsuba2
ENV BUILD_DIR build
ENV MITSUBA_PATH="/root/Mitsuba2_Install/mitsuba2"
ENV PYTHON_PATH="/root/Mitsuba2_Install/mitsuba2/dist/python:/root/Mitsuba2_Install/mitsuba2/build/dist/python:$PYTHONPATH"
ENV PATH="/root/Mitsuba2_Install/mitsuba2/dist:/root/Mitsuba2_Install/mitsuba2/build/dist:$PATH"

### Reduce image size
RUN apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove

### Change root directory
WORKDIR /root