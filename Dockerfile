FROM        node:12-alpine

LABEL       author="cyl3x" maintainer="Pterodactyl Software, <support@pterodactyl.io>"

RUN         apk add --no-cache --update libc6-compat ffmpeg \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
