FROM mamoura01/docker-raspbian-buster:latest

MAINTAINER Mathieu MOURA <mathieu.moura.64@gmail.com>

RUN apt-get update \
    && apt-get install -y \
        build-essential git python-indexed-gzip pkgconf gettext libssl-dev zlib1g-dev libpcre2-dev liburiparser-dev \
        libavahi-client-dev cmake libdvbcsa-dev wget debhelper python-requests

RUN git clone https://github.com/tvheadend/tvheadend.git

COPY raspbianbuster-armhf.sh /tvheadend/Autobuild/raspbianbuster-armhf.sh

WORKDIR /tvheadend

RUN bash -x /tvheadend/Autobuild.sh -t raspbianbuster-armhf