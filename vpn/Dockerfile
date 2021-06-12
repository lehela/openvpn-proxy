FROM debian:latest as base

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Singapore

RUN \
    apt update && \
    apt install -y \
        squid3 \
        openvpn \
        openssl \
        openresolv

RUN apt install -y \
        iputils-ping \
        dnsutils \
        ufw \
        vim \
        wget \
        telnet

COPY ./bin/*.sh /usr/local/bin/
RUN chmod -R +x /usr/local/bin

WORKDIR /etc/openvpn

ENTRYPOINT [ "entrypoint.sh" ]