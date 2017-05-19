FROM jroberts235/rpi-raspian-jessie-20160831

MAINTAINER Jeff Roberts <https://github.com/jroberts235>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install wget make gcc libc6-dev libevent-dev redis-server && \
    wget --no-check-certificate https://github.com/nicolasff/webdis/archive/0.1.1.tar.gz -O webdis-0.1.1.tar.gz && \
    tar -xvzf webdis-0.1.1.tar.gz && \
    cd webdis-0.1.1 && make && make install && cd .. && \
    rm -rf webdis-0.1.1 webdis-0.1.1.tag.gz && \
    apt-get remove wget make gcc

COPY ./etc/webdis.prod.json /etc/webdis/

CMD /etc/init.d/redis-server start && /usr/local/bin/webdis /etc/webdis/webdis.prod.json

EXPOSE 7379
