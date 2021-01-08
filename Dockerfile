FROM        frolvlad/alpine-mono

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN         echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
            && apk add --update --no-cache openssl curl sqlite libgdiplus \
            && adduser -D -h /home/container container

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"
