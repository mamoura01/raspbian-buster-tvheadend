FROM mamoura01/docker-raspbian-buster:latest

MAINTAINER Mathieu MOURA <mathieu.moura.64@gmail.com>

RUN apt-get update \
    && apt-get install -y \
        build-essential git python-indexed-gzip pkgconf gettext libssl-dev zlib1g-dev libpcre2-dev liburiparser-dev \
        libavahi-client-dev cmake libdvbcsa-dev wget

RUN ./configure --disable-libvpx --disable-libx265

RUN make

#COPY nginx.conf /etc/nginx/nginx.conf

#COPY service_start.sh /home/docker/script/service_start.sh
#RUN chmod 744 /home/docker/script/service_start.sh

#ENTRYPOINT /home/docker/script/service_start.sh
#WORKDIR /home/docker liburiparser-dev