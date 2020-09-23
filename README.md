![Docker Stars](https://img.shields.io/docker/stars/ntuangiang/opencv-cpp.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/ntuangiang/opencv-cpp.svg)
![Docker Automated build](https://img.shields.io/docker/automated/ntuangiang/opencv-cpp.svg)

# Cpp

A [C++](https://en.cppreference.com/w/) program is a sequence of text files (typically header and source files) that contain declarations. They undergo translation to become an executable program, which is executed when the [C++](https://en.cppreference.com/w/) implementation calls its main function.

# MongoDB C++ Driver

Welcome to the [MongoDB C++](http://mongocxx.org) driver. On this site, you’ll find documentation to help you get the most from [MongoDB](https://www.mongodb.com) and [C++](https://en.cppreference.com/w/). 

# OpenCV

[OpenCV](https://docs.opencv.org/) (Open Source Computer Vision Library: http://opencv.org) is an open-source library that includes several hundreds of computer vision algorithms. The document describes the so-called [OpenCV](https://docs.opencv.org/) 2.x API, which is essentially a C++ API, as opposed to the C-based [OpenCV](https://docs.opencv.org/) 1.x API (C API is deprecated and not tested with "C" compiler since OpenCV 2.4 releases)

## Docker Repository
[ntuangiang/opencv-cpp](https://hub.docker.com/r/ntuangiang/opencv-cpp) 

## Usage
- Start services

```shell script
docker run -d -p 2202:22 -p 7777:7777 ntuangiang/opencv-cpp
```

- Docker compose

```yaml
version: "3.8"

services:
  cpp:
    image: ntuangiang/opencv-cpp # Image latest
    environment:
      - DISPLAY=:0.0
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix
    ports:
      - "2202:22" # Remote
      - "7778:7777" # Debug
    restart: always
```

## Build
```shell script
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=opencv-prebuilt \
      -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_TBB=ON \
      -D WITH_FFMPEG=ON -D WITH_GPHOTO2=ON -D WITH_GSTREAMER=ON \
      -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib/modules ..
```

## License

MIT License
