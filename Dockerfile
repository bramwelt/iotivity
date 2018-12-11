FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  ccache \
  git \
  scons \
  build-essential \
  pkg-config \
  uuid-dev \
  libsqlite3-dev \
  unzip \
  libglib2.0-bin libglib2.0-data libglib2.0-dev \
  libboost* \
  libcurl4-openssl-dev \
  autoconf \
  chrpath \
  && apt-get autoremove -y && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
