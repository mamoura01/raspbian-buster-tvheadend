FROM mamoura01/docker-raspbian-buster:latest

MAINTAINER Mathieu MOURA <mathieu.moura.64@gmail.com>

RUN apt-get update \
    && apt-get install -y \
        build-essential git python-indexed-gzip pkgconf gettext libssl-dev zlib1g-dev libpcre2-dev liburiparser-dev \
        libavahi-client-dev cmake libdvbcsa-dev wget debhelper python-requests

RUN git clone https://github.com/tvheadend/tvheadend.git

COPY raspbianbuster-armhf.sh /tvheadend/Autobuild/raspbianbuster-armhf.sh

RUN bash -x /tvheadend/Autobuild.sh -t raspbianbuster-armhf

#COPY tvheadend-dbg_4.3-1804~gebb096804~raspbianbuster_armhf.deb
#tvheadend_4.3-1804~gebb096804~raspbianbuster_armhf.buildinfo
#tvheadend_4.3-1804~gebb096804~raspbianbuster_armhf.changes
#tvheadend_4.3-1804~gebb096804~raspbianbuster_armhf.deb


#COPY nginx.conf /etc/nginx/nginx.conf

#COPY service_start.sh /home/docker/script/service_start.sh
#RUN chmod 744 /home/docker/script/service_start.sh

#ENTRYPOINT /home/docker/script/service_start.sh
#WORKDIR /home/docker liburiparser-dev