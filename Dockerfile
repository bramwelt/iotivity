FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  autoconf \
  build-essential \
  ccache \
  chrpath \
  git \
  libsqlite3-dev \
  libglib2.0-bin libglib2.0-data libglib2.0-dev \
  libboost* \
  libcurl4-openssl-dev \
  pkg-config \
  scons \
  uuid-dev \
  unzip \
  wget \
  && apt-get autoremove -y && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p \
  /extlibs/tinycbor \
  /extlibs/libcoap \
  /extlibs/mbedtls \
  /extlibs/gtest

RUN git clone https://github.com/intel/tinycbor.git /extlibs/tinycbor/tinycbor -b v0.5.1
RUN git clone https://github.com/dthaler/libcoap.git /extlibs/libcoap/libcoap -b IoTivity-1.4
RUN git clone https://github.com/ARMmbed/mbedtls.git /extlibs/mbedtls/mbedtls -b mbedtls-2.4.2
RUN wget https://github.com/google/googletest/archive/release-1.7.0.zip -P /extlibs/gtest/
