
FROM openjdk:8-jre-alpine

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN         apk add --no-cache --update \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
