FROM debian:stretch

RUN apt-get update -q

# Install Platform Tooling
RUN apt-get install -q -y \
  curl make g++

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Install LLVM 3.8
RUN apt-get install -q -y \
  clang-3.8 libclang-3.8-dev llvm-3.8
RUN update-alternatives --force --install /usr/local/bin/llvm-config llvm-config /usr/bin/llvm-config-3.8 0
RUN update-alternatives --force --install /usr/local/bin/clang++ clang++ /usr/bin/clang++-3.8 0
RUN update-alternatives --force --install /usr/local/bin/clang clang /usr/bin/clang-3.8 0

# Install Python Dependencies
RUN apt-get install -q -y \
  python2.7-dev python-virtualenv

RUN mkdir /venv/
ENV VIRTUAL_ENV=/venv PATH=/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/dxr/.cargo/bin SHELL=/bin/bash

COPY ./ /home/dxr/

RUN cd /home/dxr/ ; make