FROM ubuntu:16.04

RUN echo "deb [trusted=yes] http://download.tizen.org/tools/latest-release/Ubuntu_16.04/ /" > /etc/apt/sources.list.d/tizen.list

RUN apt-get update && apt-get install -y \
  autoconf \
  build-essential \
  ccache \
  chrpath \
  git \
  gbs \
  libsqlite3-dev \
  libglib2.0-bin libglib2.0-data libglib2.0-dev \
  libboost* \
  libcurl4-openssl-dev \
  openjdk-8-jdk-headless \
  pkg-config \
  scons \
  uuid-dev \
  unzip \
  wget \
  && apt-get autoremove -y && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Create Group & User
RUN groupadd -o -g 1001 iotivity
RUN useradd -m -d /home/iotivity -u 1001 -g 1001 -s /bin/bash -G sudo iotivity

USER iotivity
WORKDIR /home/iotivity

RUN mkdir -p \
 /home/iotivity/extlibs/tinycbor \
 /home/iotivity/extlibs/libcoap \
 /home/iotivity/extlibs/mbedtls \
 /home/iotivity/extlibs/gtest \
 /home/iotivity/extlibs/hippomocks \
 /home/iotivity/extlibs/android/sdk \
 /home/iotivity/extlibs/android/ndk \
 /home/iotivity/extlibs/android/gradle

# Android Dependencies
ENV ANDROID_SDK_VERSION "r24.2"
ENV ANDROID_NDK_VERSION "r10e"
ENV ANDROID_PLATFORM_API_VERSION "21_r02"
ENV ANDROID_BUILDTOOLS_VERSION "r20"
ENV ANDROID_BUILDTOOLS_EXP_VERSION "20.0.0"
ENV ANDROID_GRADLE_VERSION "2.2.1"

WORKDIR /home/iotivity/extlibs/android/ndk
RUN wget -nv "http://dl.google.com/android/ndk/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin" \
&& chmod +x "android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin" \
&& "./android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin" \
&& rm "android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin"
# && find android-ndk-$ANDROID_NDK_VERSION/toolchains/ ! -name "arm-linux-androideabi-*" -type f -execdir rm -f '{}' +

WORKDIR /home/iotivity/extlibs/android/sdk
RUN wget -nv "http://dl.google.com/android/android-sdk_$ANDROID_SDK_VERSION-linux.tgz" \
&& tar zxvf android-sdk_$ANDROID_SDK_VERSION-linux.tgz \
&& mv android-sdk-linux android-sdk_$ANDROID_SDK_VERSION \
&& rm android-sdk_$ANDROID_SDK_VERSION-linux.tgz

WORKDIR /home/iotivity/extlibs/android/sdk/android-sdk_$ANDROID_SDK_VERSION
RUN wget -nv "http://dl.google.com/android/repository/android-$ANDROID_PLATFORM_API_VERSION.zip" \
&& unzip android-$ANDROID_PLATFORM_API_VERSION.zip -d platforms \
&& mv "platforms/android-5.0.1" "platforms/android-${ANDROID_PLATFORM_API_VERSION%%_}" \
&& rm android-$ANDROID_PLATFORM_API_VERSION.zip
RUN wget -nv "https://dl.google.com/android/repository/build-tools_$ANDROID_BUILDTOOLS_VERSION-linux.zip" \
&& unzip "build-tools_$ANDROID_BUILDTOOLS_VERSION-linux.zip" -d build-tools/ \
&& mv "build-tools/android-4.4W" "build-tools/$ANDROID_BUILDTOOLS_EXP_VERSION" \
&& rm build-tools_$ANDROID_BUILDTOOLS_VERSION-linux.zip

WORKDIR /home/iotivity/extlibs/android/gradle
RUN wget -nv "https://services.gradle.org/distributions/gradle-$ANDROID_GRADLE_VERSION-all.zip" \
&& unzip gradle-$ANDROID_GRADLE_VERSION-all.zip \
&& rm gradle-$ANDROID_GRADLE_VERSION-all.zip

WORKDIR /home/iotivity
RUN git clone https://github.com/intel/tinycbor.git extlibs/tinycbor/tinycbor -b v0.5.1
RUN git clone https://github.com/dthaler/libcoap.git extlibs/libcoap/libcoap -b IoTivity-1.4
RUN git clone https://github.com/ARMmbed/mbedtls.git extlibs/mbedtls/mbedtls -b mbedtls-2.4.2
RUN git clone https://github.com/jbeder/yaml-cpp.git extlibs/yaml/yaml
RUN wget https://github.com/google/googletest/archive/release-1.7.0.zip -P extlibs/gtest/
RUN wget https://github.com/dascandy/hippomocks/archive/v5.0.zip -P extlibs/hippomocks/

USER root
