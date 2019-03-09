FROM ubuntu:18.10

LABEL maintainer="proegssilb@gmail.com"

WORKDIR /opt

VOLUME /opt/factorio/saves /opt/factorio/mods

RUN apt-get update && apt-get dist-upgrade -y && \
    apt install -y xz-utils wget && apt-get clean

ARG factorio_version=0.16.51

ENV VERSION $factorio_version

RUN wget https://www.factorio.com/get-download/${factorio_version}/headless/linux64 -O /tmp/factorio.tar.xz
RUN tar -xJf /tmp/factorio.tar.xz && rm /tmp/factorio.tar.xz

WORKDIR /opt/factorio

EXPOSE 34197/udp
EXPOSE 27015/tcp

ENTRYPOINT ["/bin/sh", "-c", "/opt/factorio/bin/x64/factorio"]
CMD ["--start-server-load-latest"]
