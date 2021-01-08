FROM debian:8-slim

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN apt update \
    && apt upgrade -y \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt install --no-install-recommends -y lib32gcc1 lib32stdc++6 unzip curl iproute2 libgdiplus nodejs npm \
    && rm -rf /var/lib/apt/lists/*
    && mkdir /node_modules \
    && npm install --prefix / ws \
    && useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./wrapper.js /wrapper.js

CMD ["/bin/bash", "/entrypoint.sh"]
