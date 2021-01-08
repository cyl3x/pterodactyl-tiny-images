FROM        frolvlad/alpine-glibc

MAINTAINER  Pterodactyl Software, <support@pterodactyl.io>

RUN         apk add --update --no-cache curl ca-certificates openssl libstdc++ busybox-extras binutils jq \
            && apk --no-cache add  +X http://dl-cdn.alpinelinux.org/alpine/edge/testing libc++  \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
