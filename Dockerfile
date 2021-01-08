
FROM adoptopenjdk/openjdk8:alpine-slim

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>
 
 RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig tzdata iproute2 \
    && adduser --disabled-password --home /home/container container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
