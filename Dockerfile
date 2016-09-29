FROM alpine:latest

ENV JUMANPP_VERSION 1.00

RUN apk add --no-cache --virtual build-dependencies \
    boost-dev \
    g++ \
    make && \
    apk add --no-cache boost &&\
    wget http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-${JUMANPP_VERSION}.tar.xz -O /tmp/jumanpp.tar.xz && \
    tar xJvf /tmp/jumanpp.tar.xz -C /tmp && \
    cd /tmp/jumanpp-${JUMANPP_VERSION} && \
    ./configure --prefix=/usr/local/ && \
    make && \
    make install && \
    apk del build-dependencies && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

CMD jumanpp
