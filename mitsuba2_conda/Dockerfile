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

### Install package for zip and unzip
RUN apt install -y \
    wget \
    zip \
    unzip

### Install conda, create env, jupyterlab
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy && \
    /opt/conda/bin/conda init bash && \
    /opt/conda/bin/conda create -y -n mitsuba2 python=3.7 && \
    echo "source /opt/conda/bin/activate mitsuba2" >> ~/.bashrc
ENV PATH /opt/conda/envs/mitsuba2/bin:$PATH
RUN /bin/bash -c "source /opt/conda/bin/activate mitsuba2 && \
    /opt/conda/bin/conda install -y ipywidgets numpy pytorch && \
    /opt/conda/bin/conda install -y -c conda-forge jupyterlab"

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
RUN echo 'source /root/Mitsuba2_Install/mitsuba2/setpath.sh' >> ~/.bashrc

### Reduce image size
RUN apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove

### Change root directory
WORKDIR /root