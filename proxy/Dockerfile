FROM debian:latest as base

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Singapore

RUN \
    apt update && \
    apt install -y \
        socat \
        iputils-ping \
        net-tools \
        netcat \
        dnsutils \
        vim \
        wget \
        telnet

COPY ./bin/* /usr/local/bin/

RUN chmod -R +x /usr/local/bin

EXPOSE 3128

ENTRYPOINT [ "entrypoint.sh" ]