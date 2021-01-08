FROM        frolvlad/alpine-glibc

MAINTAINER  Pterodactyl Software, <support@pterodactyl.io>

RUN         apk add --update --no-cache curl ca-certificates openssl libstdc++ busybox-extras binutils libc++ jq \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
