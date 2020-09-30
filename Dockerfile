FROM ntuangiang/cpp

ENV OPENCV_VERSION 4.5.0-pre
ENV OpenCV_DIR /usr/local/lib/cmake/opencv4

ENV CMAKE_PREFIX_PATH /usr/local
ENV PKG_CONFIG_PATH /usr/local/lib64/pkgconfig

ENV XDG_RUNTIME_DIR=/tmp/runtime-root
ENV XAUTHORITY=/.Xauthority

# Install tools and dependencies
RUN apk add --update --no-cache ffmpeg ffmpeg-libs freeglut hdf5 \
    freetype jpeg openjpeg openjpeg-tools v4l-utils v4l-utils-libs gst-libav libgphoto2 gst-plugins-base \
    openblas lcms2 libxml2 libffi libxslt tiff libdc1394 openexr \
    python3 musl linux-headers tesseract-ocr qt5-qtbase

RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --update --no-cache libtbb

RUN apk add --update --no-cache --virtual=build-deps \
    python3-dev py3-pip git

RUN pip3 install --no-cache-dir numpy

RUN cd /tmp && git clone https://github.com/google/glog.git
RUN cd /tmp/glog && cmake -H. -Bbuild -G "Unix Makefiles" \
 && cmake --build build && cmake --build build --target install

# Add symbolic links
RUN mkdir -p /usr/include/libpng && \
    ln -vfs /usr/include/png.h /usr/include/libpng/png.h
RUN mkdir -p /usr/lib/x86_64-linux-gnu/ && \
    ln -vfs /usr/local/lib64/pkgconfig /usr/lib/x86_64-linux-gnu/pkgconfig
RUN ln -vfs /usr/bin/python3 /usr/local/bin/python && \
    ln -vfs /usr/bin/pip3 /usr/local/bin/pip
RUN ln -vfs /usr/include/locale.h /usr/include/xlocale.h

# Add pre-built OpenCV
ADD ./docker/opencv-prebuilt /usr/local

# Clean Up
RUN apk del build-deps && \
    rm -rf /var/cache/apk/* /tmp/glog